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

  vpc_id                      = module.vpc.vpc_id
  tags                        = var.tags
  alb_ingress_cidr            = var.alb_ingress_cidr
  alb_name                    = var.alb_name
  internal                    = var.internal
  subnets                     = module.vpc.public_subnets
  s3_bucket_id                = var.s3_bucket_id
  target_port                 = var.target_port
  unhealthy_draining_interval = var.unhealthy_draining_interval
}