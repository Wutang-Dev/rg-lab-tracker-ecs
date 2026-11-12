# Terraform backend configuration for storing state in S3
terraform {
  backend "s3" {
    bucket       = "rg-lab-tracker-terraform-state"
    key          = "terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }
}