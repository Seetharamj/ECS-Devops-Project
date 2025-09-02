variable "region" {
  description = "AWS region to deploy"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id" {
  description = "VPC ID for ECS service"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ECS and ALB"
  type        = list(string)
}

variable "sg_id" {
  description = "Security group ID for ECS service"
  type        = string
}

variable "app_image" {
  description = "Docker image for ECS service"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS cluster name for CodeDeploy"
  type        = string
}

variable "ecs_service_name" {
  description = "ECS service name for CodeDeploy"
  type        = string
}

variable "listener_arn" {
  description = "ALB listener ARN for CodeDeploy Blue/Green"
  type        = string
}

variable "target_group_blue" {
  description = "Blue target group name"
  type        = string
}

variable "target_group_green" {
  description = "Green target group name"
  type        = string
}

variable "codedeploy_role_arn" {
  description = "IAM role ARN for CodeDeploy"
  type        = string
}
