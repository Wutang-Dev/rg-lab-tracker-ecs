variable "project" {
  description = "The project name"
  type        = string
}

variable "managed_by" {
  description = "The entity managing the resources"
  type        = string
  default     = "Terraform"
}
variable "execution_role_arn" {
  description = "ARN of the ECS task execution role"
  type        = string
}

variable "app_image" {
  description = "ECR image URI for the Flask application"
  type        = string
}

variable "container_port" {
  description = "Port used by Gunicorn"
  type        = number
  default     = 5000
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs for the ECS service"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group ID for the ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group for the ECS service"
  type        = string
}
variable "app_env_parameter_arn" {
  description = "ARN of the SSM application environment parameter"
  type        = string
}