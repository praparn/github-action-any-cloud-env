resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}-InternetGW"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}
