variable "project" {
  description = "The project name"
  type        = string
}

variable "managed_by" {
  description = "The entity managing the resources"
  type        = string
}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "public_subnet_ids" {
  description = "The IDs of the public subnets"
  type        = list(string)
}
variable "alb_security_group_id" {
  description = "The ID of the ALB security group"
  type        = string

}
variable "health_check" {
  description = "Health check configuration for the ALB target group"

  type = object({
    path                = string
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
  })

  default = {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
variable "alb_target_group_port" {
  description = "The port on which the ALB target group listens"
  type        = number
  default     = 5000
}
variable "http_protocol" {
  description = "The protocol used by the ALB target group"
  type        = string
  default     = "HTTP"
}
variable "default_action" {
  description = "Default action for the ALB listener"

  type = object({
    type = string
    redirect = object({
      port        = string
      protocol    = string
      status_code = string
    })
  })

  default = {
    type = "redirect"
    redirect = {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
variable "http_port" {
  description = "The port on which the ALB listener listens for HTTP traffic"
  type        = number
  default     = 80
}
variable "ssl_policy" {
  description = "The SSL policy for the HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}
variable "certificate_arn" {
  description = "The ARN of the SSL certificate for the HTTPS listener"
  type        = string
}
variable "https_port" {
  description = "The port on which the ALB listener listens for HTTPS traffic"
  type        = number
  default     = 443
}
variable "https_protocol" {
  description = "The protocol used by the ALB HTTPS listener"
  type        = string
  default     = "HTTPS"
}
