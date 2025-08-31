output "alb_dns" { value = module.ecs.alb_dns_name }
output "ecr_repository" { value = module.ecr.repository_url }
output "service_name" { value = module.ecs.service_name }
output "cluster_name" { value = module.ecs.cluster_name }
