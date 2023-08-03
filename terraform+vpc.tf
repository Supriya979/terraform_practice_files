#Provider_plugin info
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


#Provider info
provider "aws" {
  region = "us-east-2"  # Replace this with your desired AWS region
  access_key =  "${var.myaccesskey}"
  secret_key  = "${var.mysecretkey}"
}
variable "myaccesskey"{
  type=string
}
variable "mysecretkey"{
  type=string
}
variable "subnet_id"{
  type=string
}
variable "vpc_id"{
  type=string
}
data "aws_vpc" "main"{
  cidr_block ="10.0.0.0/24"
}
variable "security_group" {
  type=string
}

#Resource info
resource "aws_instance" "ubuntu" {
  ami           = "ami-024e6efaf93d85776"  #region ami ID
  instance_type = "t2.micro"  # Replace this with your desired instance type
  key_name      = "slavekeypair"  # Replace this with your existing key pair name
  subnet_id = var.subnet_id
  security_groups = [var.security_group]

  tags = {
    Name = "VPC"
  }
}