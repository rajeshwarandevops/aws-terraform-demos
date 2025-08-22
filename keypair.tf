# Generate a new SSH key pair locally
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS EC2 Key Pair using the generated public key
resource "aws_key_pair" "dfu_key" {
  key_name   = "dfukey-aug-25"
  public_key = tls_private_key.my_key.public_key_openssh
}

# Save the private key to a local file 
resource "local_file" "private_key_pem" {
  content         = tls_private_key.my_key.private_key_pem
  filename        = "${path.module}/dfukey-aug-25.pem"
  file_permission = "0600"
}
