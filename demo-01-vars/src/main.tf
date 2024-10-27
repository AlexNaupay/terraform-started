provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "alexh-server-tf-demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.aws_key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  # security_groups = ["sg-055ab45c45ba01637"]  # BAD
  # associate_public_ip_address = true
  tags = {
    Name        = var.instance_name
    Environment = var.env_name
  }
  user_data = "${file("init.sh")}"
  #https://www.middlewareinventory.com/blog/terraform-aws-ec2-user_data-example/
}
