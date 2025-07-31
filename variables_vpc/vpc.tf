resource "aws_vpc" "newproject" {
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
    tags = {
        name = "newproject-vpc"
    }

}

resource "aws_internet_gateway" "vpc_gateway" {
    vpc_id = aws_vpc.newproject.id
    tags = {
        Name = "newproject-gateway"
    }
  
}
resource "aws_subnet" "publc_subnet" {
    vpc_id = aws_vpc.newproject.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = var.availability_zone[count.index]
    map_public_ip_on_launch = true
    count = var.subnet_count

}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.newproject.id
    cidr_block = var.private_subnet_cidr[count.index]
    availability_zone = var.availability_zone[count.index]
    count = var.private_subnet_count
  
}

resource "aws_route_table" "public" {
    vpc_id =aws_vpc.newproject.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.vpc_gateway.id
    }
    tags = {
        Name = "Public Route Table"
    }   
}

resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.publc_subnet[0].id
    route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_association_2" {
    subnet_id = aws_subnet.publc_subnet[1].id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.newproject.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.gw.id
    }

    tags = {
      name = "Private Route Table"
    }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
    allocation_id = aws_eip.eip.id
    subnet_id     = aws_subnet.publc_subnet[0].id
    tags = {
        Name = "newproject-nat-gateway"
    }
  
}