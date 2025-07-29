terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.21"
    }
  }
  backend "s3" {
    bucket = "my-date-vpc-shiva1"
    key    = "dev/terrafrom.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}