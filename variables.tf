variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR range for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "tags" {
  description = "Tags for infrastructure"
  type        = map(string)
  default = {
    project     = "iac admin testing"
    environment = "dev"
  }
}