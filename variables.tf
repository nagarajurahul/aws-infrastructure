variable "region"{
    type = string
    description = "The AWS Region where VPC will be deployed"

    validation {
      condition = can(regex("^[a-z]{2}-[a-z]+-[0-9]{1}$", var.region))
      error_message = "Please enter a valid AWS region (e.g., us-east-1, us-west-2, eu-central-1)"
    }
}

variable "vpc_cidr"{
    type = string
    description = "CIDR block for the VPC"
}

variable "vpc_name"{
    type = string
    description = "Name of the VPC"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)

  default     = { "Environment" =  "Production" }
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  
  default     = true
}

variable "azs" { 
    type = list(string) 
    description = "Availability Zones to use"
}

variable "public_subnets" { 
    type = list(string) 
    description = "List of Public Subnet CIDRs"
}
variable "private_subnets" { 
    type = list(string) 
    description = "List of Private Subnet CIDRs"
}
variable "db_subnets" { 
    type = list(string) 
    description = "List of DB Subnet CIDRs"
}