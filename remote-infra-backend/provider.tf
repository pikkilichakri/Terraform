terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }

  backend "s3" {
    bucket         = "82s-project-infra-data123"  # Replace with actual S3 bucket name
    key            = "expense-project-backend-infra-file" 
    region         = "us-east-1"  
    dynamodb_table = "expense_backend_project_lock12557577"  # Replace with actual DynamoDB table name
    #encrypt        = true  
  }
}

provider "aws" {
  region = "us-east-1"
}

# S3 Bucket Resource
# resource "aws_s3_bucket" "remote_bucket" {
#   bucket = "your-existing-s3-bucket-name"  # Ensure this bucket exists beforehand
# }

# DynamoDB Table Resource for Locking
# resource "aws_dynamodb_table" "basic_dynamodb_table" {
#   name         = "your-existing-dynamodb-table-name"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
