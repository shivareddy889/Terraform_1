resource "aws_instance" "my_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    count = terraform.workspace == "dev" ?2 : 1
    tags = {
      Name = format("Instance-%d-%s", count.index, terraform.workspace)
    }
  
}