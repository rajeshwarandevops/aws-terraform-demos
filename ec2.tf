
# Get latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Launch EC2 instance

# Launch multiple EC2 instances
resource "aws_instance" "dfu_instance" {
  #count         = 2 # Change this to how many you want
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.dfu_key.key_name
  vpc_security_group_ids      = [aws_security_group.dfusg.id]
  subnet_id                   = aws_subnet.Public-Subnet-A.id
  associate_public_ip_address = true
  # Load script from file
  user_data = file("nginx.sh")

  tags = {
    # Name = "dfu-instance-${count.index + 1}"
    Name = "Mobileapp-Web"
  }
}
