resource "aws_key_pair" "shiva_key" {
    key_name   = "shiva_key_pair"
    public_key = file("~/.ssh/id_rsa.pub")

}