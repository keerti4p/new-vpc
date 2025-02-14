// Variables file for Terraform

variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "humbot"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.0.0/20"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.144.0/20"]
}

variable "availability_zones" {
  description = "List of availability zones to be used in the region"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    "Team" = "Humbot"
  }
}
