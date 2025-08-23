# MAIN VPC
resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Mobileapp-Vpc"
  }
}

# PUBLIC SUBNET - Zone A (Singapore)
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Mobileapp-Public-Subnet-A"
  }
}

# PRIVATE SUBNET - Zone B (Singapore)
resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "Mobileapp-Public-Subnet-B"
  }
}
