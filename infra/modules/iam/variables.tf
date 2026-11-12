variable "project" {
  description = "The project name"
  type        = string
}

variable "managed_by" {
  description = "The entity managing this resource"
  type        = string
  default     = "Terraform"
}