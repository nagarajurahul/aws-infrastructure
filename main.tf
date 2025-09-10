provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  region             = var.region
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  tags               = var.tags
  enable_nat_gateway = true
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  db_subnets         = var.db_subnets
}

resource "aws_s3_bucket" "sample_bucket" {
  bucket = "my-sample-bucket-app-test-terraform-aws-infrastructure"

  tags = var.tags
}

module "alb" {
  source = "./modules/alb"

  vpc_id                      = module.vpc.vpc_id
  tags                        = var.tags
  alb_ingress_cidr            = var.alb_ingress_cidr
  alb_name                    = var.alb_name
  internal                    = var.internal
  subnets                     = module.vpc.public_subnets
  s3_bucket_id                = aws_s3_bucket.sample_bucket.id
  target_port                 = var.target_port
  unhealthy_draining_interval = var.unhealthy_draining_interval
}

module "asg" {
  source = "./modules/asg"

  tags             = var.tags
  type             = var.type
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  hibernation_mode = var.hibernation_mode
  key_name         = var.key_name
  user_data        = var.user_data

  asg_name          = var.asg_name
  subnets           = module.vpc.private_subnets
  desired_capacity  = var.desired_capacity
  max_size          = var.max_size
  min_size          = var.min_size
  target_group_arns = [module.alb.app_blue_target_group_arn]
}