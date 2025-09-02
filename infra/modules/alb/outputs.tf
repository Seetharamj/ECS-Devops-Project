output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "blue_target_group_arn" {
  value = aws_lb_target_group.blue.arn
}

output "listener_arn" {
  value = aws_lb_listener.app.arn
}

output "sg_id" {
  value = aws_security_group.alb_sg.id
}

