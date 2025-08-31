terraform {
backend "s3" {
bucket = "my-tf-state-1234" # update after backend creation
key = "ecs-bluegreen/terraform.tfstate"
region = "ap-south-1"
dynamodb_table = "tf-locks"
encrypt = true
}
}


provider "aws" {
region = var.region
}


module "networking" {
source = "./modules/networking"
name = var.name
vpc_cidr = var.vpc_cidr
public_subnet_cidrs = var.public_subnet_cidrs
}


module "ecr" {
source = "./modules/ecr"
name = var.name
}


module "ecs" {
source = "./modules/ecs"
name = var.name
vpc_id = module.networking.vpc_id
public_subnet_ids = module.networking.public_subnet_ids
container_port = var.container_port
desired_count = var.desired_count
app_health_check = var.app_health_check
ecr_repo_url = module.ecr.repository_url
}


module "codedeploy" {
source = "./modules/codedeploy"
name = var.name
ecs_cluster_name = module.ecs.cluster_name
ecs_service_name = module.ecs.service_name
listener_arn = module.ecs.listener_arn
blue_tg_arn = module.ecs.blue_target_group_arn
green_tg_arn = module.ecs.green_target_group_arn
}
