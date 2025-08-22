# Internet Gateway
resource "aws_internet_gateway" "dfu-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "dfu-IGW"
  }
}