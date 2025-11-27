variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_username" {
  description = "username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "password for the database"
  type        = string
  sensitive   = true
}