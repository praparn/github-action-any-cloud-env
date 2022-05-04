resource "aws_nat_gateway" "aws_nat_gateway1a" {
  allocation_id = aws_eip.scblf_eipnat_1a.id
  subnet_id     = aws_subnet.subnet_public_1a.id

  tags = {
    Name = "${var.vpc_name}-NATGateway1A"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_nat_gateway" "aws_nat_gateway1b" {
  allocation_id = aws_eip.scblf_eipnat_1b.id
  subnet_id     = aws_subnet.subnet_public_1b.id

  tags = {
    Name = "${var.vpc_name}-NATGateway1B"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_nat_gateway" "aws_nat_gateway1c" {
  allocation_id = aws_eip.scblf_eipnat_1c.id
  subnet_id     = aws_subnet.subnet_public_1c.id

  tags = {
    Name = "${var.vpc_name}-NATGateway1C"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}