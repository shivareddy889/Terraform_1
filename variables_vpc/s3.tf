resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-shiva"
  tags = {
    Name        = "MyBucket"
    Environment = "Dev" 
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    id     = "KeepOnlyLast3Versions"
    status = "Enabled"

    noncurrent_version_expiration {
      newer_noncurrent_versions = 3
      noncurrent_days           = 1
    }
  }
}
