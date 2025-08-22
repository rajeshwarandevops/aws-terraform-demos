# MAIN VPC
resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Mobileapp-Vpc"
  }
}

# PUBLIC SUBNET 
resource "aws_subnet" "Public-Subnet-A" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Mobileapp-Public-Subnet-A"
  }
}

# PRIVATE SUBNET 
resource "aws_subnet" "Privatesubnet-A" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Mobileapp-Private-Subnet-A"
  }
}
