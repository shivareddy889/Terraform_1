terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket         = "my-backup-s3-state"
    key            = "app/terraform.tfstate"
    region         = "ap-south-1"
    workspace_key_prefix = "env"
    
  }
}

