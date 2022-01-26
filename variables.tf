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
    name     = "CreatedWithTerraform"
    environment = "dev"
  }

  validation {
    condition     = length(var.tags["project"]) <= 16 && length(regexall("/[^a-zA-Z0-9-]/", var.tags["project"])) == 0
    error_message = "The project tag must be no more than 16 characters, and only contain letters, numbers, and hyphens."
  }

  validation {
    condition     = length(var.tags["environment"]) <= 8 && length(regexall("/[^a-zA-Z0-9-]/", var.tags["environment"])) == 0
    error_message = "The environment tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }
}