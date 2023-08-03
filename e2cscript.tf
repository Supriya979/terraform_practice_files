terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Replace this with your desired AWS region
  access_key = "${var.myaccesskey}"
  secret_key  = "${var.mysecretkey}"
}
variable "myaccesskey"{
  type=string
}
variable "mysecretkey"{
  type=string
}

resource "aws_security_group" "security-1" {
  name_prefix = "security-1-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from any IP
  }
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-053b0d53c279acc90"  # ubuntu ami1 ID
  instance_type = "t2.micro"  # Replace this with your desired instance type
  key_name      = "keypair_jenkins"  # Replace this with your existing key pair name

  tags = {
    Name = "firstec2instacne"
  }
}
