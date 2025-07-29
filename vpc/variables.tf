variable "bucket_name" {
    type = string
     

}
variable "tags" {
    type = map(string)
}
variable "ami" {
    type = string
}
variable "instance_count" {
    type = number
}               
variable "instance_type" {
    type = string
}
