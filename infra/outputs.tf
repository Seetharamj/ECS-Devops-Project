output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "ecr_repository" { value = module.ecr.repository_url }
output "service_name" { value = module.ecs.service_name }
output "cluster_name" { value = module.ecs.cluster_name }
