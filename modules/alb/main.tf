module "security_group" {
  source = "../security-group"

  type   = "alb"
  vpc_id = var.vpc_id
  tags   = var.tags
}

module "security_group_rules" {
  source = "../security-group-rules/alb"

  security_group_id = module.security_group.security_group_id
  alb_ingress_cidr  = var.alb_ingress_cidr
}

resource "aws_lb" "alb" {
  name               = "${var.alb_name}-alb"
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [module.security_group.security_group_id]
  subnets            = var.subnets

  enable_deletion_protection = true

  access_logs {
    bucket  = var.s3_bucket_id
    prefix  = "${var.alb_name}-alb-access"
    enabled = true
  }

  connection_logs {
    bucket  = var.s3_bucket_id
    prefix  = "${var.alb_name}-alb-connection"
    enabled = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.alb_name}-alb"
    }
  )
}

resource "aws_lb_target_group" "app_blue" {
  name        = "${var.alb_name}-app-blue-tg"
  target_type = "instance"
  port        = var.target_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  target_health_state {
    enable_unhealthy_connection_termination = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.alb_name}-app_blue-tg"
    }
  )
}

resource "aws_lb_target_group" "app_green" {
  name        = "${var.alb_name}-app-green-tg"
  target_type = "instance"
  port        = var.target_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  target_health_state {
    enable_unhealthy_connection_termination = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.alb_name}-app_green-tg"
    }
  )
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.app_blue.arn
        weight = 100
      }
      target_group {
        arn    = aws_lb_target_group.app_green.arn
        weight = 0
      }
    }
  }
}