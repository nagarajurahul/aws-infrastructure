# Private Subnets
resource "aws_subnet" "private"{
    count = length(var.private_subnets)

    vpc_id            = aws_vpc.main.id
    cidr_block        = var.private_subnets[count.index]
    availability_zone = var.azs[count.index]

    assign_ipv6_address_on_creation = var.enable_ipv6
    ipv6_cidr_block = var.enable_ipv6 ? var.private_subnets_ipv6[count.index] : null

    tags = merge(
      var.tags, 
      {
        Name = "${var.vpc_name}-private-${count.index}"
      }
    )
}

# Public Subnets
resource "aws_subnet" "public"{
    count = length(var.public_subnets)

    vpc_id            = aws_vpc.main.id
    cidr_block        = var.public_subnets[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = true

    assign_ipv6_address_on_creation = var.enable_ipv6
    ipv6_cidr_block = var.enable_ipv6 ? local.public_subnet_ipv6_cidrs[count.index] : null
    
    tags = merge(
      var.tags, 
      {
          Name = "${var.vpc_name}-public-${count.index}"
      }
    )
}

# DB Subnets
resource "aws_subnet" "db" {
  count = length(var.db_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.db_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-db-${count.index}"
  })
}