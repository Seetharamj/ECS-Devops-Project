variable "name" {
  type    = string
  default = "adv-ecs-bluegreen"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for ECS and ALB"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task execution"
}

variable "app_image" {
  type        = string
  description = "ECR image for ECS app"
}

variable "listener_arn" {
  type        = string
  description = "ALB Listener ARN"
}

variable "codedeploy_role_arn" {
  type        = string
  description = "CodeDeploy role ARN"
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "container_port" {
  type    = number
  default = 80
}
