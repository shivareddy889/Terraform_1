resource "aws_instance" "lookup" {
  ami               = var.ami
  instance_type     = lookup(var.instance_type, var.availability_zone)
  availability_zone = var.availability_zone
  count             = var.instance_count
  tags = {
    Name = "lookup_instance-${count.index + 1}"

  }

}