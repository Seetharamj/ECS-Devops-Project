variable "name" {
  type    = string
  default = "adv-ecs-bluegreen"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "app_image" {
  description = "Docker image for the ECS container"
  type        = string
}

variable "desired_count" {
  type    = number
  default = 2
}

variable "app_health_check" {
  type = object({
    path                = string
    healthy_threshold   = number
    unhealthy_threshold = number
    timeout             = number
    interval            = number
  })
  default = {
    path                = "/health"
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 5
    interval            = 15
  }
}

variable "sg_id" {
  description = "Security Group ID for ECS tasks"
  type        = string
}

variable "ecr_repo_url" {
  description = "ECR repository URL for the app image"
  type        = string
}


variable "target_group_blue" {
  type        = string
  default     = "blue-tg"
  description = "Name of blue target group"
}

variable "target_group_green" {
  type        = string
  default     = "green-tg"
  description = "Name of green target group"
}

variable "listener_arn" {
  type        = string
  description = "ARN of the ALB listener for CodeDeploy traffic routing"
}

variable "codedeploy_role_arn" {
  type        = string
  description = "IAM Role ARN for CodeDeploy to manage ECS"
}
