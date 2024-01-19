terraform {
  required_version = "1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }
  }

}

provider "aws" {
  region = "us-east-1"
  #access_key = "ASIA3Q6LG7A6DQNUWW6G"
  #secret_key = "iHHsCFwcdMheEBaIUk3DOjIT986EQhNMKqt0cTrA"

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  user_data       = "#!/bin/bash \n sudo apt update \n sudo apt install apache2 -y"
  key_name        = "vockey"
  security_groups = ["web-server-sg-tf"]

  tags = {
    Name = "TERRAFORM <3"
  }
}

resource "aws_security_group" "web_server_sg_tf" {

  name = "web-server-sg-tf"

  description = "Allow HTTPS to web server"




  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}