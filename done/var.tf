variable "s3_bucket" {
    type        = string
    description = "S3 bucket for Terraform state storage"

  
}

variable "s3_key" {
    type        = string
    description = "S3 key for Terraform state storage"

}

variable "aws_region" {
    type        = string
    description = "AWS region"

}

variable "aws_profile" {
    type        = string
    description = "AWS profile"

}
