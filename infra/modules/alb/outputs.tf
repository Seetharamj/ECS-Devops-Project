output "alb_dns" {
  value = module.alb.alb_dns_name
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "listener_arn" {
  value = module.alb.listener_arn
}

output "blue_target_group_arn" {
  value = module.alb.blue_target_group_arn
}

output "green_target_group_arn" {
  value = module.alb.green_target_group_arn
}
