provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-09186c326c40fd6cc"
  instance_type          = "t3.small"
  key_name               = "PROJECT 1"
  vpc_security_group_ids = ["sg-01916c9d4f5f21716"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
