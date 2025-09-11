# aws-infrastructure
aws-infrastructure

---
## Usage

```
provider "aws" {
  region = "us-east-2"
}

module "infra" {
  source = "github.com/rahulnagaraju/terraform-aws-infrastructure?ref=v2.0.0"

  # Required inputs
  region   = "us-east-2"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "demo-vpc"
  azs      = ["us-east-2a", "us-east-2b", "us-east-2c"]

  public_subnets = [
    "10.0.0.0/20",
    "10.0.16.0/20",
    "10.0.32.0/20",
  ]

  private_subnets = [
    "10.0.48.0/20",
    "10.0.64.0/20",
    "10.0.80.0/20",
  ]

  db_subnets = [
    "10.0.96.0/20",
    "10.0.112.0/20",
    "10.0.128.0/20",
  ]

  enable_nat_gateway = true


  alb_ingress_cidr   = "0.0.0.0/0"
  alb_name           = "demo"
  internal           = false
  alb_enable_deletion_protection = false
  target_port        = 8080

  type               = "app"
  ami_id             = "ami-xxxxxxxx"
  instance_type      = "t3.micro"
  hibernation_mode   = false
  user_data_file     = "scripts/user_data.sh"

  asg_name           = "demo-asg"
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1

  tags = {
    Environment = "production"
    Owner       = "platform-team"
  }
}
```