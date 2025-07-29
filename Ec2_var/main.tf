resource "aws_instance" "devops1" {
  ami           = var.ami
  instance_type = var.instance_type

}