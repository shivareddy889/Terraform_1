resource "aws_instance" "key_pair" {
    ami =  var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.shiva_key.key_name
    count = var.instance_count
    tags = {
        Name = "key_pair_instance${count.index}"
        Environment = lookup(var.tags, "Environment", "default")
    }
        
    }