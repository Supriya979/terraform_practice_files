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
#resource (VPC)
