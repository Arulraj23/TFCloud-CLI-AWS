
resource "aws_route_table" "public_route_table" {
  vpc_id       = var.vpc_id

  route {
    gateway_id = var.igw_id
    cidr_block = "0.0.0.0/0"
    
  }
  route {
    cidr_block = "10.0.0.0/24"
    gateway_id = var.igw_id
}

  tags       = {
    Name = "${var.project_name}-rtable"
  }
}

resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = var.subnet_id #aws_subnet.public_subnet_az2.id
  route_table_id      = aws_route_table.public_route_table.id
}