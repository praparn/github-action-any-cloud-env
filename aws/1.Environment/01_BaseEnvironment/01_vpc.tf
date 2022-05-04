resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}