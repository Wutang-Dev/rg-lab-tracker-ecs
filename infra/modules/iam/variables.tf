variable "project" {
  description = "The project name"
  type        = string
}

variable "managed_by" {
  description = "The entity managing this resource"
  type        = string
  default     = "Terraform"
}
variable "app_env_parameter_arn" {
  description = "ARN of the SSM application environment parameter"
  type        = string
}
