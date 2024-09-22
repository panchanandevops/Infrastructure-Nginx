locals {
  tls_keys = {
    algorithm            = "RSA"
    rsa_bits             = 4096
    private_key_filename = "./.ssh/terraform_rsa"
    public_key_filename  = "./.ssh/terraform_rsa.pub"
  }

  aws_key_pair_name = "ubuntu_ssh_key"

  vpc = {
    cidr_block = "10.0.0.0/16"
  }

  subnet = {
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true
  }

  ingress = {
    http_port  = 80
    https_port = 443
    ssh_port   = 22
  }

  egress_port = 0

  ec2_instance = {
    ami                         = "ami-0a0e5d9c7acc336f1"
    instance_type               = "t2.micro"
    associate_public_ip_address = true
  }
}



provider "aws" {
  region = "us-east-1"
}

module "nginx-module" {
  source = "./nginx-module"

  tls_keys = local.tls_keys
  aws_key_pair_name = local.aws_key_pair_name
  vpc = local.vpc
  subnet = local.subnet
  ingress = local.ingress
  egress_port = local.egress_port
  ec2_instance = local.ec2_instance

}
