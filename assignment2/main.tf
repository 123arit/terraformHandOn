terraform {
  required_providers {
    aws = "~> 5.0"
  }
}
provider "aws" {
  //version = "5.14.0" #deprecated
  profile = "adfs"
  region  = "us-east-1" # N.Virginia
}

resource "aws_vpc" "web_vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Web VPC"
  }
}

resource "aws_subnet" "web_subnet_1" {
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = "172.31.80.0/20"
  availability_zone = "us-east-1"
  tags = {
    Name = "Web Subnet 1"
  }
}

resource "aws_subnet" "web_subnet_2" {
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = "172.31.16.0/20"
  availability_zone = "us-east-1"
  tags = {
    Name = "Web Subnet 2"
  }
}
