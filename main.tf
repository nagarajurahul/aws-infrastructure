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

module "alb" {
  source = "./modules/alb"

  vpc_id           = module.vpc.vpc_id
  tags             = var.tags
  alb_name         = "app"
  internal         = false
  subnets          = module.vpc.public_subnets
  alb_ingress_cidr = "0.0.0.0/0"
  target_port      = 8080
  s3_bucket_id     = "ABC..."
  unhealthy_draining_interval = 60
}