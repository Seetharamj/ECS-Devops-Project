variable "name" { type = string default = "adv-ecs-bluegreen" }
variable "region" { type = string default = "ap-south-1" }
variable "vpc_cidr" { type = string default = "10.0.0.0/16" }
variable "public_subnet_cidrs" { type = list(string) default = ["10.0.1.0/24", "10.0.2.0/24"] }
variable "container_port" { type = number default = 8080 }
variable "desired_count" { type = number default = 2 }
variable "app_health_check"{
type = object({
path = string
healthy_threshold = number
unhealthy_threshold = number
timeout = number
interval = number
})
default = {
path = "/health"
healthy_threshold = 2
unhealthy_threshold = 5
timeout = 5
interval = 15
}
}
