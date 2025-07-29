resource "aws_instance" "count" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "count${count.index}"
  }
}