output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.main.id
}

output "private_subnets"{
    description = "Private subnets"
    value = aws_subnet.private[*].id

    sensitive   = true
}

output "public_subnets"{
    description = "Public subnets"
    value = aws_subnet.public[*].id

    sensitive   = true
}

output "db_subnets"{
    description = "DB subnets"
    value = aws_subnet.db[*].id

    sensitive   = true
}