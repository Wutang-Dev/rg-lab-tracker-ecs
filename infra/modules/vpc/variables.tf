#variables for vpc cidr block
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "project" {
  description = "The name of the project"
  type        = string
}

variable "managed_by" {
  description = "The entity managing the resources"
  type        = string
}
variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC"
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
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