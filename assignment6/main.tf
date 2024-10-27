#### Create a security group in aws cloud ####

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "my-access-key" #this is a very bad way to authenticate, only used here for demo purpose
  secret_key = "my-secret-key" #this is a very bad way to authenticate, only used here for demo purpose
}

provider "aws" {
  alias = "mumbai"
  region = "ap-south-1" # Mumbai
  access_key = "my-access-key" #this is a very bad way to authenticate, only used here for demo purpose
  secret_key = "my-secret-key" #this is a very bad way to authenticate, only used here for demo purpose
}

resource "aws_security_group" "example" {
  name        = "terraform_lab_allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  provider = aws.mumbai

  ingress {
      description      = "HTTPS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
