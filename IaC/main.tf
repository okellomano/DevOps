terraform {
  backend "s3" {
    bucket = "postbnd-tf-state"
    key = "postbnd/tf-infra/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt = true
  }
 
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "db_pass_1" {
  description = "Password for database #1"
  type = string
  sensitive = true
}

variable "db_pass_2" {
  description = "Password for database #2"
  type = string
  sensitive = true
}

module "web_app_1" {
  source = "../web-app-modules"

  # Input variables
  bucket_prefix = "web-app-1-data"
  domain = "postbnd.saqle.com"
  app_name = "web-app-1"
  environment_name = "production"
  instance_type = "t2.micro"
  create_dns_zone = true
  db_name = "webapp1db"
  db_user = "idiot"
  db_pass = var.db_pass_1
}

module "web_app_2" {
  source = "../web-app-modules"

  # Input variables
  bucket_prefix = "web-app-2-data"
  domain = "anotherpostbnd.saqle.com"
  app_name = "web-app-2"
  environment_name = "production"
  instance_type = "t2.micro"
  create_dns_zone = true
  db_name = "webapp2db"
  db_user = "idiot"
  db_pass = var.db_pass_2
}

# compute
# Storage
# Networking
# dns
resource "aws_dynamodb_table" "terraform_locks" {
  name = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
