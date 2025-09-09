output "vpc_id" {
  description = "The ID of the VPC"
  value = module.vpc.vpc_id
}

output "private_subnets"{
    description = "Private subnets"
    value = module.vpc.private_subnets

    sensitive   = true
}

output "public_subnets"{
    description = "Public subnets"
    value = module.vpc.public_subnets

    sensitive   = true
}

output "db_subnets"{
    description = "DB subnets"
    value = module.vpc.db_subnets

    sensitive   = true
}