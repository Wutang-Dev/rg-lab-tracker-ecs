resource "aws_security_group" "alb" {
  name        = "${var.project}-alb-sg"
  description = var.alb_description
  vpc_id      = var.vpc_id

  ingress = [
    merge(var.alb_ingress_port_80, {
      description      = "Allow HTTP"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }),
    merge(var.alb_ingress_port_443, {
      description      = "Allow HTTPS"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    })
  ]

  egress = [
    merge(var.alb_egress, {
      description      = "Allow outbound traffic"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    })
  ]

  tags = {
    Name      = "${var.project}-alb-sg"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_security_group" "ecs" {
  name        = "${var.project}-ecs-sg"
  description = var.ecs_description
  vpc_id      = var.vpc_id

  ingress = [
    merge(var.ecs_ingress_port_5000, {
      description      = "Allow Gunicorn traffic from ALB"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.alb.id]
      self             = false
    })
  ]
  egress = [
    merge(var.ecs_egress, {
      description      = "Allow outbound traffic"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    })
  ]
  tags = {
    Name      = "${var.project}-ecs-sg"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
