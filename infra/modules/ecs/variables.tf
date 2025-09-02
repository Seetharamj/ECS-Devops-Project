variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "name" {
  type        = string
  description = "Name prefix for ECS resources"
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for ECS tasks"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ECS service"
  type        = list(string)
}


variable "sg_id" {
  type        = string
  description = "Security group ID for ECS tasks"
}
variable "execution_role_arn" {
  description = "ECS Task Execution Role ARN"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group for ECS service"
  type        = string
}

variable "container_port" {
  type        = number
  description = "Port for ECS container"
}

variable "desired_count" {
  type        = number
  default     = 2
  description = "Number of ECS tasks"
}

variable "app_image" {
  type        = string
  description = "Docker image for ECS container"
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
