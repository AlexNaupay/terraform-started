provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "alexh-server-tf-demo" {
  ami           = "ami-064519b8c76274859"
  instance_type = "t2.micro"
  key_name      = "alexh-north-virginia"
  vpc_security_group_ids = ["sg-055ab45c45ba01637"]
  # security_groups = ["sg-055ab45c45ba01637"]  # BAD
  # associate_public_ip_address = true
  tags = {
    Name        = "alexh-tf-demo-vm"
    Environment = "Dev"
  }
  user_data = "${file("init.sh")}"
  #https://www.middlewareinventory.com/blog/terraform-aws-ec2-user_data-example/
}
