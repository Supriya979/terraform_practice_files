#Terraform Script to create resources : 
    # (VPC, Subnet, Internet gateway, security group, route table)

#Provider Block
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

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "11.15.150.0/24"        #11.15.150.0 - 11.15.150.255
  tags = {
    name = "My_vpc"
  }
}

# Create a Subnet1
resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "11.15.150.0/25"      #11.15.150.0 - 11.15.150.127
  availability_zone = "us-east-1a"
  tags = {
    Name = "My_subnet1"
  }
}

# Create a Subnet2
resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "11.15.150.128/25"    #11.15.150.128 - 11.15.150.255
  availability_zone = "us-east-1b"
  tags = {
    Name = "My_subnet2"
  }
}

#create a Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc1_gatewway"
  }
}

#Route table associate to gateway 
resource "aws_route_table" "default" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Gova_Route"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

#Route Associate to subnet
resource "aws_route_table_association" "assoc_subnet1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.default.id
}
resource "aws_route_table_association" "assoc_subnet2" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.default.id
}

resource "aws_security_group" "my_secgroup" {
  name        = "my_secgroup"
  description = "Allow SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  } 
}



