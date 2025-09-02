output "ecs_cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}

output "ecs_task_definition" {
  value = aws_ecs_task_definition.app.arn
}
