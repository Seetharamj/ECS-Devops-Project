output "alb_dns_name" {
  value = aws_lb.app.dns_name
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
