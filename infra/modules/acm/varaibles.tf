variable "validation_method" {
  description = "The validation method for the ACM certificate"
  type        = string
  default     = "DNS"
}
variable "domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
}
variable "managed_by" {
  description = "The entity managing the resources"
  type        = string
  default     = "Terraform"
}
variable "project" {
  description = "The project name"
  type        = string
  default     = "rg-lab-tracker-ecs"
}
variable "validation_record_fqdns" {
  description = "FQDNs of the ACM DNS validation records"
  type        = list(string)
}