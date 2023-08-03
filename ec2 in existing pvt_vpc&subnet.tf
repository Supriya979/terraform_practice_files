#Script to create new aws_ec2_instance & in an existing private_vpc & subnet


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
}

variable "security_group_id" {
 type    = string
 default = "sg-02f6a845e3bbc4c71"
}

data "aws_security_group" "selected" {
 id = var.security_group_id
}

resource "aws_instance" "private_instance" {
  ami = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  key_name      = "devopsnew7pm"
  subnet_id = "subnet-0951e2ffcde6ed381"

  count = 1
 
  tags = {
	Name = "ubuntu123"
	}
}


