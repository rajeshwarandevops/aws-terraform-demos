
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

# Launch multiple EC2 instances
resource "aws_instance" "dfu_instance" {
  count                       = length(local.subnets)
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.dfu_key.key_name
  vpc_security_group_ids      = [aws_security_group.dfusg.id]
  subnet_id                   = local.subnets[count.index] # deploy instances Zone A & Zone B
  associate_public_ip_address = true
  user_data                   = file("nginx.sh")

  tags = {
    Name = "dfu-instance-${count.index + 1}"
  }
}
