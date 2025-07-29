output "instance_id" {
  value = aws_instance.devops1.id
}

output "instance_public_ip"{
    value = aws_instance.devops1.public_ip
}