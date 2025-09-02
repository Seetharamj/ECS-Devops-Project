output "alb_arn" {
  value = aws_lb.app.arn
}

output "listener_arn" {
  value = aws_lb_listener.app.arn
}

output "blue_target_group_arn" {
  value = aws_lb_target_group.blue.arn
}

output "green_target_group_arn" {
  value = aws_lb_target_group.green.arn
}
output "alb_dns" {
  value = module.alb.alb_dns_name
}
