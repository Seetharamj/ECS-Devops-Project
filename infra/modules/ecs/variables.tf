variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "target_group_arn" {
  description = "ARN of the target group for the ECS service"
  type        = string
}


variable "public_subnet_ids" {
  type = list(string)
}

variable "cluster_name" {
  type = string
  description = "Name of the ECS cluster"
}


variable "container_port" {
  type = number
}

variable "desired_count" {
  type = number
}

variable "app_health_check" {
  type = object({
    path                = string
    healthy_threshold   = number
    unhealthy_threshold = number
    timeout             = number
    interval            = number
  })
}

variable "ecr_repo_url" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "app_image" {
  type = string
}
