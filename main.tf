provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-02b8269d5e85954ef "
  instance_type          = "t3.small"
  key_name               = "PROJECT2"
  vpc_security_group_ids = ["sg-003b7529b72b3f3fd"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
