resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "app" {
  family                   = var.name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([{
    name  = var.name
    image = var.app_image
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
  }])
}
resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "Security group for ECS tasks"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.container_port
    to_port         = var.container_port
    protocol        = "tcp"
    security_groups = [module.alb.sg_id]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_ecs_service" "app" {
  name            = "${var.name}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets = var.public_subnet_ids
    assign_public_ip = true
    security_groups  = [var.sg_id]
  }

  load_balancer {
   target_group_arn = var.target_group_arn
    container_name   = var.name
    container_port   = var.container_port
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }
}
