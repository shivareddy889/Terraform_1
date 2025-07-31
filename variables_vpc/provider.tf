terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
      bucket = "my-unique-bucket-name-shiva"
      key = "aws/terraform.tfstate"
      region = "ap-south-1"
  }
}

provider "aws" {
    region = "ap-south-1"
    profile = "default"
}