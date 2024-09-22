resource "tls_private_key" "ssh_key" {
  algorithm = var.tls_keys.algorithm

  rsa_bits = var.tls_keys.rsa_bits
}

resource "local_file" "private_key" {
  content = tls_private_key.ssh_key.private_key_pem

  filename = var.tls_keys.private_key_filename
}

resource "local_file" "public_key" {
  content  = tls_private_key.ssh_key.public_key_openssh

  filename = var.tls_keys.public_key_filename
}

resource "aws_key_pair" "deployer" {
  key_name   = var.aws_key_pair_name

  public_key = tls_private_key.ssh_key.public_key_openssh
}
