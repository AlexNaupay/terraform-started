variable "env_name" {}
variable "aws_region" {
  default = "us-east-1"
  description = "AWS Region"
}
variable "ami_id" {
}
variable "instance_type" {
}
variable "aws_key_name" {
  description = "AWS key to use"
}
variable "vpc_security_group_ids" {type = list(string)}
variable "instance_name" {}

