variable "project" {
  description = "The name of the project"
  type        = string
}

variable "app_environment" {
  description = "The application environment (e.g., dev, prod)"
  type        = string
}

variable "managed_by" {
  description = "The entity managing the resource"
  type        = string
}
