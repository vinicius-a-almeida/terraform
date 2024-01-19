variable "aws_region" {
  type = string
  description = ""
  default = "us-east-1"

}

variable "instance_ami" {
  type = string
  description = "Image"
  default = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  type = string
  description = "Instance type"
  default = "t2.micro"
}

variable "instance_tags" {
  type = map(string)
  description = "Tags"
  default = {
    Name = "Ubuntu"
  }
}