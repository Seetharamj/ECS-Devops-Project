variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "app_image" {
  description = "Docker image for the Flask app"
  type        = string
}

variable "subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "sg_id" {
  description = "Security Group ID for ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "ALB Target Group ARN"
  type        = string
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 2
}

variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
  default     = "devops-ecs-cluster"
}

variable "app_health_check" {
  type = object({
    path              = string
    healthy_threshold = number
    unhealthy_threshold = number
    timeout           = number
    interval          = number
  })
}

variable "ecr_repo_url" {
  type = string
}
