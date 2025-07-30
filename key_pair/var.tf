variable "ami_id"{
    type = string
    description = "ami id"
}

variable "instance_type" {
    type = string
    description = " instance type"
}
variable "instance_count" {
    type = number
    description = "number of instances "
     }
variable "tags"{
    type = map(string)
    description = "tags for the instance"
}


