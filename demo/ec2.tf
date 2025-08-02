resource "aws_instance" "demo_instance" {
  ami                    =  var.ami_id
  instance_type          =  var.instance_type
  availability_zone      =  var.availability_zone[count.index]
  count                  =  var.count_instance
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  tags = {
    Name = "ExampleInstance-${count.index + 1}"
  }

}

resource "aws_security_group" "demo_sg" {
  name        = "var.demo_sg"
  description = "Security group for demo instances"
  dynamic "ingress" {
    for_each = var.aws_security_group_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.aws_security_group_egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }

  }
  tags = {
    Name = "DemoSecurityGroup"
  }
}

