variable "region" {
  description = "The AWS region to create resources in."
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance."
}

variable "key_name" {
  description = "The key pair name to use for SSH access."
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)."
  default     = "dev"
}