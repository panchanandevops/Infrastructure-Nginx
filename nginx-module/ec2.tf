# Create Ubuntu EC2 Instance
resource "aws_instance" "ubuntu_instance" {
  ami                         = var.ec2_instance.ami
  instance_type               = var.ec2_instance.instance_type
  associate_public_ip_address = var.ec2_instance.associate_public_ip_address

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_http_https.id]
  key_name               = aws_key_pair.deployer.key_name

  depends_on = [
    aws_security_group.allow_ssh_http_https,
    aws_internet_gateway.igw
  ]

  user_data = file("${path.module}/scripts/nginx-script.sh")

  tags = {
    Name = "ubuntu-instance"
  }
}
