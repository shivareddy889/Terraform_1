resource "aws_s3_bucket" "awsbucket" {
    for_each = var.tags
    bucket = var.bucket_name
    tags = {
        Name = each.value
        }  
}