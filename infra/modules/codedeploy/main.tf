provider "aws" {
  region = var.region
}

resource "aws_ecs_cluster" "this" {
  name = var.ecs_cluster_name
}


resource "aws_ecs_task_definition" "app" {
  family                   = "flask-app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "flask-app"
    image     = var.app_image
    essential = true
    portMappings = [{
      containerPort = 5000
      hostPort      = 5000
    }]
  }])
}


resource "aws_lb_target_group" "blue" {
  name        = var.target_group_blue
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_target_group" "green" {
  name        = var.target_group_green
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_ecs_service" "app" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.public_subnet_ids
    assign_public_ip = true
    security_groups  = [var.sg_id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.blue.arn
    container_name   = "flask-app"
    container_port   = 5000
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }
}


resource "aws_codedeploy_app" "ecs" {
  name             = "flask-app-codedeploy"
  compute_platform = "ECS"
}

resource "aws_codedeploy_deployment_group" "ecs" {
  app_name               = aws_codedeploy_app.ecs.name
  deployment_group_name  = "flask-app-deploy-group"
  service_role_arn       = var.codedeploy_role_arn
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"

  ecs_service {
    cluster_name = aws_ecs_cluster.this.name
    service_name = aws_ecs_service.app.name
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [var.listener_arn]
      }

      target_groups {
        name = aws_lb_target_group.blue.name
      }

      target_groups {
        name = aws_lb_target_group.green.name
      }
    }
  }
}
