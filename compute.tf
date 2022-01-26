### Terraform Block ###
# Contains Terraform settings, including the required providers 
#    Terraform will use to provision your infrastructure.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0.0"
    }
  }

  required_version = "> 0.14"
}

### Provider Block ###
# Configures the specified provider, in this case AWS. 
#   A provider is a plugin that Terraform uses to create and manage 
#   your resources.
provider "aws" {
  profile = "ts-master"
  region  = var.aws_region
}

### Resource Block ###
# Defines components of your infrastructure. 
# A resource might be a physical or virtual component such as 
# an EC2 instance, or it can be a logical resource such as a Heroku app
resource "aws_instance" "MyEC2" {
  ami           = "ami-0aeeebd8d2ab47354"
  instance_type = "t2.micro"
  tags          = var.tags
}

resource "aws_vpc" "MainVPC" {
  cidr_block = var.vpc_cidr_block
}