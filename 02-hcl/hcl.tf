terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-dimple-bucket"

}

#Manged externally, we just want to use it in our project
data "aws_s3_bucket" "my_external_bucket" {
  bucket = "not-managed-by-us"
}

# Outputs data in the terminal
output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}
