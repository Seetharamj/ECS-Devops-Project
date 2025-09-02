variable "name" {
  type    = string
  default = "adv-ecs-bluegreen"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_id" {
  description = "VPC ID for ECS and ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
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

# ALB variables
variable "subnets" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
  default     = "my-alb"
}

variable "listener_port" {
  description = "Port for the ALB listener"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Protocol for the ALB listener"
  type        = string
  default     = "HTTP"
}
variable "ecr_repo_url" {
  description = "ECR repository URL for the app image"
  type        = string
}

variable "listener_arn" {
  description = "ARN of the ALB listener for ECS"
  type        = string
}

