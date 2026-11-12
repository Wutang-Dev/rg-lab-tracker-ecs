variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-north-1"
}
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "project" {
  description = "The project name"
  type        = string
  default     = "rg-lab-tracker-ecs"
}
variable "managed_by" {
  description = "The entity managing the resources"
  type        = string
  default     = "Terraform"
}
variable "availability_zones" {
  description = "The list of availability zones"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "nat_gateway_domain" {
  description = "The domain for the NAT Gateway Elastic IP"
  type        = string
  default     = "vpc"
}
