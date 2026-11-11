variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-north-1"
}
variable "terraform_state_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
  default     = "rg-lab-tracker-terraform-state"
}
variable "project" {
  description = "The name of the project"
  type        = string
  default     = "rg-lab-tracker"
}
variable "managed_by" {
  description = "The entity managing the resources"
  type        = string
  default     = "terraform"
}
