module "security_group"{
    source = "../security-group"

    type = "alb"
    vpc_id = var.vpc_id
}

module "security_group_rules"{
    source = "../security-group-rules/alb"

    security_group_id = module.security_group.security_group_id
    alb_ingress_cidrs = var.alb_ingress_cidrs
}

resource "aws_lb" "alb" {
  name               = "${var.alb_name}-alb"
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [module.security_group.security_group_id.id]
  subnets            = [for subnet in subnets : subnet.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = s3_bucket_id
    prefix  = "${var.alb_name}-alb"
    enabled = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.alb_name}-alb"
    }
  )
}

resource "aws_lb_target_group" "lb" {
  name        = "${var.alb_name}-tg"
  target_type = "instance"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.main.id

  target_health_state = {
    enable_unhealthy_connection_termination = true
    unhealthy_draining_interval = 60
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.alb_name}-alb"
    }
  )
}