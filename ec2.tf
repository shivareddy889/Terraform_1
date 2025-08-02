module "ec2" {
  source = "./demo/" 
  ami_id                  = "ami-0f918f7e67a3323f0"
  instance_type =  "t2.micro"
  availability_zone = ["ap-south-1a", "ap-south-1b"]
  count_instance = 2
  demo_sg = "demo_security_group"
  aws_security_group_ingress = [
        {
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
        },
        {       
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    ]
 aws_security_group_egress = [
        {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }   ]

}