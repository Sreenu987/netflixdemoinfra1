provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-00d8fc944fb171e29"
  instance_type          = "t3.small"
  key_name               = "PROJECT2"
  vpc_security_group_ids = ["sg-01916c9d4f5f21716"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
