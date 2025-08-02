module "ec2_module" {
  source = "./ec2_module/"
  ami_id                     = "ami-0f918f7e67a3323f0"
  instance_type              = "t2.micro"
  security_group_name        = "module_ec2_sg_1"
  security_group_description = "Security group for EC2 instance"
  security_inbound_rules = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  security_outbound_rules = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}]
}