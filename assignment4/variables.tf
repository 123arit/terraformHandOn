# Example of a string variable
variable "network_cidr" {
  default = "172.31.80.0/20"
}

# Example of a list variable
variable "availability_zones" {
  default = ["us-east-1c", "us-east-1d"]
}

# Example of an integer variable
variable "instance_count" {
  default = 2
}

# Example of a map variable
variable "ami_ids" {
  default = {
    "us-west-2" = "ami-2757f631"
    "us-east-1" = "ami-2757f631"
  }
}
