variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
}
variable "domain_validation_options" {
  description = "DNS validation options supplied by ACM"

  type = set(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_type  = string
    resource_record_value = string
  }))
}
variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  type        = string
}
variable "alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB"
  type        = string
}
variable "app_domain_name" {
  description = "Fully qualified domain name for the ECS application"
  type        = string
}