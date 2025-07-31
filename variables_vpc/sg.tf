resource "aws_security_group" "sg" {
    name = var.security_group_name
    description = var.security_description  
    vpc_id = aws_vpc.newproject.id
    dynamic "ingress" {
    for_each = var.security_group_inbound_rules
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      description = ingress.value.description
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidrblocks
    }
  }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }
}