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

resource "aws_s3_bucket" "s3" {
  bucket = "my-s3-bucket-app-test-terraform-aws-infrastructure"

  tags = var.tags
}

resource "aws_s3_bucket_policy" "allow_access_from_alb" {
  bucket = aws_s3_bucket.s3.id
  policy = data.aws_iam_policy_document.allow_access_from_alb.json
}

data "aws_iam_policy_document" "allow_access_from_alb" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logdelivery.elasticloadbalancing.amazonaws.com"]
    }

    actions = [
      "s3:PutObject"
    ]

    # Only allow PutObject to objects within the bucket
    resources = [
      "${aws_s3_bucket.s3.arn}/*"
    ]
  }

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logdelivery.elasticloadbalancing.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl"
    ]

    # This action applies to the bucket itself
    resources = [
      aws_s3_bucket.s3.arn
    ]
  }
}

module "alb" {
  source = "./modules/alb"

  vpc_id                      = module.vpc.vpc_id
  tags                        = var.tags
  alb_ingress_cidr            = var.alb_ingress_cidr
  alb_name                    = var.alb_name
  internal                    = var.internal
  alb_enable_deletion_protection = var.alb_enable_deletion_protection
  subnets                     = module.vpc.public_subnets
  s3_bucket_id                = aws_s3_bucket.s3.id
  target_port                 = var.target_port
}

module "asg" {
  source = "./modules/asg"

  vpc_id           = module.vpc.vpc_id
  tags             = var.tags
  type             = var.type
  alb_security_group_id = module.alb.alb_security_group_id
  app_port         = var.target_port
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  hibernation_mode = var.hibernation_mode
  key_name         = var.key_name
  user_data_file        = "${path.root}/${var.user_data_file}"

  asg_name          = var.asg_name
  subnets           = module.vpc.private_subnets
  desired_capacity  = var.desired_capacity
  max_size          = var.max_size
  min_size          = var.min_size
  target_group_arns = [module.alb.app_blue_target_group_arn]
}