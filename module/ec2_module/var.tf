variable "ami_id" {
    type = string
    description = "AMI ID for the EC2 instance"
  
}
variable "instance_type" {
    type = string
    description = "Instance type for the EC2 instance"
}
variable "security_group_name" {
    type = string
    description = "Name of the security group for the EC2 instance"
    }

variable "security_group_description" {
    type = string
    description = "Description of the security group for the EC2 instance"
}       

variable "security_inbound_rules" {
    type = list(object({
        from_port =number
        to_port = number
        protocol = string
        cidr_blocks = list(string)
    }))
}

variable "security_outbound_rules" {
    type = list(object({
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = list(string)
    }))

}

