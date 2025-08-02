variable "ami" {
  type    = string
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  type = map(string)
  default = {
    "ap-south-1a" = "t2.medium"
    "us-east-1"  = "t2.micro"
    "us-west-2"  = "t2.small"
  }

}
variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}

variable "instance_count" {
  type    = number
  default = 2

}