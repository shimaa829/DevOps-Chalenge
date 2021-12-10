# AWS provider
provider "aws" {

  region  = var.region
  profile = "aws_access"

}

# VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = {
      Name="My-VPC"
  }
