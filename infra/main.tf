terraform {
backend "s3" {
bucket = "my-tf-state-9842"
key = "ecs-bluegreen/terraform.tfstate"
region = "us-east-1"
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

module "alb" {
  source  = "./modules/alb"
  vpc_id  = var.vpc_id
  subnets = var.public_subnet_ids   
  alb_name = var.alb_name
  listener_port = var.listener_port

}


module "ecs" {
  source           = "./modules/ecs"
  name             = var.name
  cluster_name = "my-ecs-cluster"
  service_name     = "my-ecs-service"
  vpc_id           = var.vpc_id
  execution_role_arn = var.execution_role_arn
  public_subnet_ids  = module.networking.public_subnet_ids  
  target_group_arn = module.alb.blue_target_group_arn
  container_port   = var.container_port
  desired_count    = var.desired_count
  app_health_check = var.app_health_check
  sg_id            = var.sg_id
  app_image        = var.app_image
}





