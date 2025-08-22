# Security group
resource "aws_security_group" "dfusg" {
  name        = "dfusg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

            egress {
              description = "Allow all outbound traffic"
              from_port   = 0
              to_port     = 0
              protocol    = "-1"
              cidr_blocks = ["0.0.0.0/0"]
            }

                tags = {
                  Name = "dfusg"
                }
}
