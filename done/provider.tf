terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
    
    required_version = ">= 1.0"
}
provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

terraform {
  backend "s3" {
    bucket         = "my-module-backend-storage"
    key            = "key/terraform/state"
    region         = "ap-south-1"
    encrypt        = true
  }
}
