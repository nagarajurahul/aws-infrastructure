# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags, 
    {
      Name = "${var.vpc_name}-igw" 
    }
  )
}

# NAT Gateways (One per AZ if enabled)
resource "aws_eip" "nat" {
  count = var.enable_nat ? length(var.public_subnets) : 0
  vpc   = true
}

resource "aws_nat_gateway" "nat" {
  count         = var.enable_nat ? length(var.public_subnets) : 0
  
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-nat-${count.index}"
  })
}

