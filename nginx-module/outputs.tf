# Output the Public IPs
output "ubuntu_instance_public_ip" {
  value = aws_instance.ubuntu_instance.public_ip
}