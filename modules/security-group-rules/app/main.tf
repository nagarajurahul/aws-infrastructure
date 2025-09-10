resource "aws_vpc_security_group_ingress_rule" "app_from_alb" {
  security_group_id = var.security_group_id
  referenced_security_group_id = var.alb_security_group_id
  from_port         = var.app_port
  to_port           = var.app_port
  ip_protocol       = "tcp"
  description       = "Allow inbound traffic from ALB"
}


resource "aws_vpc_security_group_egress_rule" "all_ipv4" {
  security_group_id = var.security_group_id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}