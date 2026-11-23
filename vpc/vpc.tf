resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr

}
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets)
  
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.public_subnets[count.index]
  
  tags = {
    Name = var.public_subnets_names[count.index]
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets)
  
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.private_subnets[count.index]
  tags = {
    Name = var.private_subnets_names[count.index]
  }  
}

resource "aws_internet_gateway" "my_gw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id 
  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.my_gw.id
  }
}

resource "aws_route_table_association" "route_table_association" {
  count = length(var.public_subnets)
  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.myrt.id
}
