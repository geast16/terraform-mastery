terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}


provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}

resource "aws_s3_bucket" "bucket_this" {
  bucket = "testbucketfortfmastery-course1"
}

resource "aws_s3_bucket" "east1_bucket_this" {
  bucket   = "testbucketfortfmastery-course179"
  provider = aws.us-east
}
