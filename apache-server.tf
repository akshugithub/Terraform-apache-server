provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "apache-server" {
#  count                  = "2"
  ami                    = "ami-0f8ca728008ff5af4"
  instance_type          = "t2.micro"
  key_name               = "mykeypair"
  vpc_security_group_ids = [aws_security_group.apache-secgrp.id]
  tags = {
     Name = "apache-server"
     Environment = "dev"
  }  
} 
 resource "aws_security_group" "apache-secgrp" {
  name = "apache-secgrp"   
  ingress {
    description = "Allow port 22 - inbound"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow port 8080 - inbound"
    from_port   = 8080
    to_port     = 8080 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }   
  egress {
    description = "outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
