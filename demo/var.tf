variable "ami_id" {
  type = string


}
variable "instance_type" {
  type = string
}
variable "availability_zone" {
  type = list(string)

}

variable "count_instance" {
  type = number

}
variable "demo_sg" {
  type        = string
  description = "Name of the security group for demo instances"
}

variable "aws_security_group_ingress" {
  type = list(object
    ({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
  }))
}

variable "aws_security_group_egress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}