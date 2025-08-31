resource "aws_codedeploy_app" "ecs" {
 name = "flask-app-codedeploy"
 compute_platform = "ECS"
}
resource "aws_codedeploy_deployment_group" "ecs" {
 app_name = aws_codedeploy_app.ecs.name
 deployment_group_name = "flask-app-deploy-group"
 service_role_arn = var.codedeploy_role_arn
 deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"
 ecs_service {
 cluster_name = var.ecs_cluster_name
 service_name = var.ecs_service_name
 }
 load_balancer_info {
 target_group_pair_info {
 prod_traffic_route {
 listener_arns = [var.listener_arn]
 }
 target_group {
 name = var.target_group_blue
 }
 target_group {
 name = var.target_group_green
 }
 }
 }
}
