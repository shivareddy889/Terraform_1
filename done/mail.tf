module "ec2_module" {
  source = "./ec2_module/"
  ami_id                  = ami-0f918f7e67a3323f0
  instance_type           = t2.micro
  security_group_name     = "module_ec2_sg"
  security_group_description = "Security group for EC2 instance"
  vpc_id                  = "vpc-07e4406d5bd0f66e2"
  count                 = 2
  security_inbound_rules  = [{
    from_port =22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
    {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  security_outbound_rules = [{
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }]
}
