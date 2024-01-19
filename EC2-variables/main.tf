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
  region = var.aws_region
  #access_key = "ASIA3Q6LG7A6DQNUWW6G"
  #secret_key = "iHHsCFwcdMheEBaIUk3DOjIT986EQhNMKqt0cTrA"
  
}

resource "aws_instance" "web" {
  ami             = var.instance_ami
  instance_type   = var.instance_type
  user_data       = "#!/bin/bash \n sudo apt update \n sudo apt install apache2 -y"
  key_name        = "vockey"
  security_groups = ["web-server-sg-tf"]

  tags = var.instance_tags
}

resource "aws_security_group" "web_server_sg_tf" {

  name = "web-server-sg-tf"

  description = "Allow HTTPS to web server"




  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
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
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}