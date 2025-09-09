provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  region          = var.region
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  db_subnets      = var.db_subnets
  vpc_name        = var.vpc_name
  enable_nat_gateway      = true
  tags            = var.tags

}