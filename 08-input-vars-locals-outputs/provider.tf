terraform {
  required_version = "~>1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}
# AMI ID - us-east-1: ami-0d016af584f4febe3
# AMI ID - eu-west-1: ami-046da914e42bb0388
provider "aws" {
  region = "us-east-1"
}
