resource "aws_instance" "this" {
  ami = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone[0]
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y httpd
    echo "Hello, World!" > /var/www/html/index.html
    systemctl start httpd
    systemctl enable httpd
EOF
}