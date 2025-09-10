resource "aws_vpc_security_group_ingress_rule" "https_ipv4" {
  security_group_id = var.security_group_id
  cidr_ipv4         = var.alb_ingress_cidr
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description = "Allow HTTPS inbound traffic access to ALB - ipv4"
}


resource "aws_vpc_security_group_egress_rule" "all_ipv4" {
  security_group_id = var.security_group_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
}

