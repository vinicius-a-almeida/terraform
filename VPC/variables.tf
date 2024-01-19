variable "env" {
  description = "Insira o nome de sua VPC"
}

variable "vpc_cidr" {
  default = "10.0.0.0/21"
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
  ]
}

variable "private_subnet_cidrs" {
  default = [
    "10.0.3.0/24",
    "10.0.4.0/24",
  ]
}

variable "tags" {
  default = {
    Owner   = "Vinicius Almeida"
    Project = "Terraform"
  }
}