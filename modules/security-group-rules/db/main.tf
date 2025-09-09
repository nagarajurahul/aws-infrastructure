resource "aws_vpc_security_group_ingress_rule" "db_from_app" {
  security_group_id            = var.security_group_id
  referenced_security_group_id = var.app_security_group_id
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
  description                  = "Allow inbound traffic access from App"
}

resource "aws_vpc_security_group_egress_rule" "all_ipv4" {
  security_group_id = var.security_group_id
  # cidr_ipv4         = "0.0.0.0/0"
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
}