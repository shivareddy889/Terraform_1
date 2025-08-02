resource "aws_instance" "module_ec2" {
   ami = var.ami_id
   instance_type = var.instance_type
   count = 2
   vpc_security_group_ids = [aws_security_group.module_ec2_sg.id]

   tags = {
       Name = "EC2Instance-${count.index + 1}"
   }

}

resource "aws_security_group" "module_ec2_sg" {
    name = var.security_group_name
    description = var.security_group_description
    dynamic "ingress" {
        for_each = var.security_inbound_rules
        content {
            from_port = ingress.value.from_port
            to_port = ingress.value.to_port
            protocol = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
    dynamic "egress" {
        for_each = var.security_outbound_rules
        content {
            from_port = egress.value.from_port
            to_port = egress.value.to_port
            protocol = egress.value.protocol
            cidr_blocks = egress.value.cidr_blocks
        }
    }
  
}