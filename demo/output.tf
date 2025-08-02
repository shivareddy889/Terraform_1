output "public_ip" {
  value = aws_instance.demo_instance[*].public_ip

}

output "private_ip" {
  value = aws_instance.demo_instance[*].private_ip

}

output "name_instance" {
  value = [for instance in aws_instance.demo_instance : instance.tags["Name"]]

}

output "security_group_id" {
  value = aws_security_group.demo_sg.id
}

output "instance_count" {
  value = length(aws_instance.demo_instance)

}
