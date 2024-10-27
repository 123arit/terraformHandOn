terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }
  }
}
provider "aws" {
  profile = "adfs"
  region  = "us-east-1" # N. Virginia
}
provider "aws" {
  profile = "adfs"
  alias   = "west"
  region  = "us-west-2" # Oregon
}

resource "aws_vpc" "web_vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Web VPC"
  }
}

# resource "aws_subnet" "web_subnet_1" {
#   vpc_id                  = aws_vpc.web_vpc.id
#   cidr_block              = "172.31.80.0/20"
#   availability_zone       = "us-east-1c"
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "Web Subnet 1"
#   }
# }

# resource "aws_subnet" "web_subnet_2" {
#   vpc_id                  = aws_vpc.web_vpc.id
#   cidr_block              = "172.31.16.0/20"
#   availability_zone       = "us-east-1d"
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "Web Subnet 2"
#   }
# }

# resource "aws_instance" "instance-1" {
#   ami           = "ami-2757f631"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.web_subnet_1.id
#   tags = {
#     Name = "Web Server 1"
#   }
#   provisioner "local-exec" {
#     command    = "echo Hello > hello.txt"
#     on_failure = "continue"
#   }
# }
