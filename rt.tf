# Public Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dfu-igw.id
  }

  tags = {
    Name = "Mobileapp-Public-RT"
  }
}

# Associate Public Subnet with Route Table
resource "aws_route_table_association" "public-subnet--A-assoc" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-subnet--B-assoc" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public-rt.id
}