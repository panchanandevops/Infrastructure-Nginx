variable "tls_keys" {
  description = "TLS key configuration: includes the algorithm used, RSA bit size, and filenames for the private and public keys."
  type = object({
    algorithm            = string
    rsa_bits             = number
    private_key_filename = string
    public_key_filename  = string
  })

  default = {
    algorithm            = "your_algorithm"
    rsa_bits             = 2048
    private_key_filename = "your_private_key_path"
    public_key_filename  = "your_public_key_path"
  }
}

variable "aws_key_pair_name" {
  description = "The name of the AWS key pair to be used for SSH access."
  type    = string
  default = "your_key_pair_name"
}

variable "vpc" {
  description = "VPC configuration with CIDR block for defining the network range."
  type = map(string)
  default = {
    cidr_block = "your_cidr_block"
  }
}

variable "subnet" {
  description = "Subnet configuration: includes CIDR block, availability zone, and whether to assign public IPs."
  type = object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  })

  default = {
    cidr_block              = "your_subnet_cidr_block"
    availability_zone       = "your_availability_zone"
    map_public_ip_on_launch = true
  }
}

variable "ingress" {
  description = "Ingress rules for allowed inbound traffic: HTTP, HTTPS, and SSH port numbers."
  type = map(number)
  default = {
    http_port  = 80
    https_port = 443
    ssh_port   = 22
  }
}

variable "egress_port" {
  description = "Egress port configuration, representing the allowed outbound port range."
  type = number
  default = 0
}

variable "ec2_instance" {
  description = "EC2 instance configuration: includes AMI ID, instance type, and whether to associate a public IP address."
  type = object({
    ami                         = string
    instance_type               = string
    associate_public_ip_address = bool
  })

  default = {
    ami                         = "your_ami_id"
    instance_type               = "your_instance_type"
    associate_public_ip_address = true
  }
}
