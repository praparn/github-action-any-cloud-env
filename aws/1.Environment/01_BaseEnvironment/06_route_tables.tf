resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_internet_gateway.igw]
  route {
    cidr_block = var.cidr_block_rtb_public
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
      Name = "${var.vpc_name}-PublicRouteTable"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
  }
}

resource "aws_route_table" "rtb_private1a" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_nat_gateway.aws_nat_gateway1a]
  route {
    cidr_block     = var.cidr_block_rtb_private
    nat_gateway_id = aws_nat_gateway.aws_nat_gateway1a.id
  }

  tags = {
      Name = "${var.vpc_name}-Private1ARouteTable"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
  }
}

resource "aws_route_table" "rtb_private1b" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_nat_gateway.aws_nat_gateway1b]
  route {
    cidr_block     = var.cidr_block_rtb_private
    nat_gateway_id = aws_nat_gateway.aws_nat_gateway1b.id
  }

  tags = {
      Name = "${var.vpc_name}-Private1BRouteTable"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
  }
}

resource "aws_route_table" "rtb_private1c" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_nat_gateway.aws_nat_gateway1c]
  route {
    cidr_block     = var.cidr_block_rtb_private
    nat_gateway_id = aws_nat_gateway.aws_nat_gateway1c.id
  }

  tags = {
      Name = "${var.vpc_name}-Private1CRouteTable"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
  }
}

resource "aws_route_table_association" "rtbass_private1a" {
  subnet_id      = aws_subnet.subnet_private_1a.id
  route_table_id = aws_route_table.rtb_private1a.id
}

resource "aws_route_table_association" "rtbass_private1b" {
  subnet_id      = aws_subnet.subnet_private_1b.id
  route_table_id = aws_route_table.rtb_private1b.id
}

resource "aws_route_table_association" "rtbass_private1c" {
  subnet_id      = aws_subnet.subnet_private_1c.id
  route_table_id = aws_route_table.rtb_private1c.id
}

resource "aws_route_table_association" "rtbass_publica1a" {
  subnet_id      = aws_subnet.subnet_public_1a.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_route_table_association" "rtbass_public1b" {
  subnet_id      = aws_subnet.subnet_public_1b.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_route_table_association" "rtbass_public1c" {
  subnet_id      = aws_subnet.subnet_public_1c.id
  route_table_id = aws_route_table.rtb_public.id
}