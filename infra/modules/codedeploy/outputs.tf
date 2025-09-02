output "ecs_cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.app.arn
}

output "codedeploy_app_name" {
  value = aws_codedeploy_app.ecs.name
}

output "codedeploy_deployment_group" {
  value = aws_codedeploy_deployment_group.ecs.deployment_group_name
}

output "blue_target_group_arn" {
  value = aws_lb_target_group.blue.arn
}

output "green_target_group_arn" {
  value = aws_lb_target_group.green.arn
}
