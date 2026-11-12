variable "project" {
  description = "The project name"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "managed_by" {
  description = "The entity managing the resources"
  type        = string
  default     = "Terraform"
}
variable "alb_description" {
  description = "The description for the ALB security group"
  type        = string
  default     = "ALB security group allows incoming http and https traffic from the internet"
}
variable "ecs_description" {
  description = "The description for the ECS security group"
  type        = string
  default     = "ECS SG allows incoming traffic on port 5000 (gunicorn and flask) only from ALB security group"
}
variable "alb_ingress_port_80" {
  description = "The ingress rule for ALB on port 80"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
variable "alb_ingress_port_443" {
  description = "The ingress rule for ALB on port 443"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
variable "alb_egress" {
  description = "The egress rule for ALB security group"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
variable "ecs_egress" {
  description = "The egress rule for ECS security group"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
variable "ecs_ingress_port_5000" {
  description = "The ingress rule for ECS on port 5000"
  type = object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
  })
  default = {
    from_port       = 5000
    to_port         = 5000
    protocol        = "tcp"
    security_groups = []
  }
}