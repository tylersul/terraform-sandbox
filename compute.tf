terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0.0"
    }
  }

  required_version = "> 0.14"
}

provider "aws" {
  profile = "iac-user-master"
  region  = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_instance" "public-ec2" {
  ami           = "ami-0aeeebd8d2ab47354"
  instance_type = "t2.micro"
  tags          = var.tags
}