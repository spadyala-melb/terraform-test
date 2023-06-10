variable "ami" {
  type        = string
  description = "ami"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  type        = string
  description = "ec2 instance type"
}


variable "subnet_id" {
  type        = string
  description = "Subnet Id"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}
