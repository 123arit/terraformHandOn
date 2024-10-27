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
}

provider "aws" {
  alias = "euwest"
  region = "eu-west-2" # London
}

resource "time_sleep" "wait_30_seconds" {

  create_duration = "30s"
}
