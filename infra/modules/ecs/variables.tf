variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "container_port" {
  type = number
}

variable "desired_count" {
  type = number
}

variable "app_health_check" {
  type = string
}

variable "ecr_repo_url" {
  type = string
}

variable "sg_id" {
  type = string
}
