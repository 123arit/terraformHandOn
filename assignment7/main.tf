terraform {
  required_providers {
    aws = "~> 5.0"
  }
}
provider "aws" {
  profile = "adfs"
  region  = "us-east-1" # N. Virginia
}
provider "aws" {
  alias   = "west"
  profile = "adfs"
  region  = "us-west-2" # Oregon
}


# module "consul" {
#   //<NAMESPACE>/<NAME>/<PROVIDER>
#   source  = "hashicorp/consul/aws"
#   version = "0.11.0"
# }

module "vpc" {
  //Private registry module
  //<HOSTNAME>/<NAMESPACE>/<NAME>/<PROVIDER>  
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"
}

resource "aws_vpc" "web_vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Web VPC"
  }
}
/*
resource "aws_subnet" "web_subnet_1"{
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = "172.31.80.0/20"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "Web Subnet 1"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "my-ec2-cluster"
  instance_count = 2

  ami                    = "ami-2757f631"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_vpc.web_vpc.default_security_group_id]
  subnet_id              = aws_subnet.web_subnet_1.id

  tags = {
    Terraform   = "true"
    Environment = "sandbox"
  }
}
*/
