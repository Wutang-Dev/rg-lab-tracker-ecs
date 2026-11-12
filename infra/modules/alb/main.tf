# aws lb
resource "aws_lb" "main" {
  name               = "${var.project}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name      = "${var.project}-alb"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_lb_target_group" "main" {
  name        = "${var.project}-tg"
  port        = var.alb_target_group_port
  protocol    = var.http_protocol
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = var.health_check.path
    interval            = var.health_check.interval
    timeout             = var.health_check.timeout
    healthy_threshold   = var.health_check.healthy_threshold
    unhealthy_threshold = var.health_check.unhealthy_threshold
    matcher             = "200"
  }
  tags = {
    Name      = "${var.project}-tg"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.http_port
  protocol          = var.http_protocol

  default_action {
    type = var.default_action.type
    redirect {
      port        = var.default_action.redirect.port
      protocol    = var.default_action.redirect.protocol
      status_code = var.default_action.redirect.status_code
    }
  }
}
