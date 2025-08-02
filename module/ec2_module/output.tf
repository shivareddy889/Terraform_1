output "publick_ip" {
  value = aws_instance.module_ec2[*].public_ip
  
}

output "privite_ip" {
  value = aws_instance.module_ec2[*].private_ip
  
}

output "instance_id" {
  value = aws_instance.module_ec2[*].id
  
}

output "security_group_id" {
  value = aws_security_group.module_ec2_sg.id
}   