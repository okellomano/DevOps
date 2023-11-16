# General Variable

variable "region" {
  description = "Default region for provider"
  type = string
  default = "us-east-1"
}

# EC2 Variables

variable "ami" {
  description = "Amazom machine image for ec2 instance"
  type = string
  default = "ami-011899242bb902164"
}

variable "instance_type" {
  description = "ec2 instance type"
  type = string
  default = "t2.micro"
}

variable "instance_name" {
  description = "Name of ec2 instance"
  type = string
}

# S3 Variables

variable "bucket_prefix" {
  description = "prefix for s3 bucket for app data"
  type = string
}

# Route 53 Variables

variable "domain" {
  description = "website domain name"
  type = string
}

# RDS Variables

variable "db_name" {
  description = "Name of db"
  type = string
}

variable "db_user" {
  description = "username for database"
  type = string
  default = "idiot"
}

variable "db_pass" {
  description = "db password"
  type = string
  sensitive = true
}