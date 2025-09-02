output "alb_dns" {
  value = module.alb.alb_dns_name   
}

output "target_group_arn" {
  value = module.alb.blue_target_group_arn
}

output "listener_arn" {
  value = module.alb.listener_arn
}

output "ecr_repository" { value = module.ecr.repository_url }
output "service_name" { value = module.ecs.service_name }
output "cluster_name" { value = module.ecs.cluster_name }
