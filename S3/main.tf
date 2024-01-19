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


}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "vini-tf-bucket123411"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Vinicius Almeida"
    UpdateAt    = "2024-01-19"
  }
}