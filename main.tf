terraform {
  backend "s3" {
    bucket         = "s3statebucket123456"
    dynamodb_table = "state-lock"
    key            = "statefile/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
}

# VPC Module
module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.0.0/24"
}

# EC2 module
module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-06ddbc40823fba89a"
  instance_type = "t2.micro"
  instance_name = "ec2-instance"
  subnet_id     = module.vpc.subnet_id
  vpc_id        = module.vpc.vpc_id
}
