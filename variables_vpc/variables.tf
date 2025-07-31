variable "vpc_cidr_block" {
    type = string
    description = "value of the VPC CIDR block"
  
}

variable "public_subnet_cidr" {
    type = list(string)
    description = "CIDR block for the public subnet"
  
}

variable "availability_zone" {
    type = list
    description = "Availability zone for the public subnet"
  
}

variable "subnet_count" {
    type = number

  
}

variable "private_subnet_cidr" {
    type = list(string)
    description = "CIDR block for the private subnet"
  
}

variable "private_subnet_count" {
    type = number
    description = "Number of private subnets"   

  
}
variable "security_group_name" {
    type = string
    description = "Security Group Name"
  
}

variable "security_description" {
    type = string
    description = "Security Group Description"

}
variable "security_group_inbound_rules" {
    type = list(object({
        from_port = number
        to_port = number
        description = string
        protocol = string
        cidrblocks = list(string)
    }))
    description = "Security Group Inbound Rules"
  
}

variable "ami_id" {
    type = string
    description = "AMI ID"
  
}
variable "instance_type" {
    type = string
    description = "EC2 Instance Type"
  
}   