output "instance_public_ips" {
  value = [for instance in aws_instance.count : instance.public_ip]
}

output "instance_private_ips" {
  value = [for instance in aws_instance.count : instance.private_ip]
}

output "key"{
    value = "count is ${var.instance_count}"
}

output "key_name" {
    value = aws_key_pair.shiva_key.key_name
}

output "tags"{
    value = "tags of instance is ${lookup(var.tags, "Name")}"
}