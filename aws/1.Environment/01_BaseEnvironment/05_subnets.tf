############################################################################################################
# Generic Subnet Operation                                                                                 #
############################################################################################################

resource "aws_subnet" "subnet_public_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_public_1a_cidr
  availability_zone = var.az1

  tags = {
    Name = "${var.vpc_name}-Public1A"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_subnet" "subnet_public_1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_public_1b_cidr
  availability_zone = var.az2

  tags = {
    Name = "${var.vpc_name}-Public1B"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_subnet" "subnet_public_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_public_1c_cidr
  availability_zone = var.az3

  tags = {
    Name = "${var.vpc_name}-Public1C"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_subnet" "subnet_private_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_private_1a_cidr
  availability_zone = var.az1

  tags = {
    Name = "${var.vpc_name}-Private1A"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_subnet" "subnet_private_1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_private_1b_cidr
  availability_zone = var.az2

  tags = {
    Name = "${var.vpc_name}-Private1B"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_subnet" "subnet_private_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_private_1c_cidr
  availability_zone = var.az3

  tags = {
    Name = "${var.vpc_name}-Private1C"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

############################################################################################################
# RDS Subnet Operation                                                                                     #
############################################################################################################

resource "aws_db_subnet_group" "rds_subnet_group" {
    depends_on = [aws_subnet.subnet_private_1a, aws_subnet.subnet_private_1b, aws_subnet.subnet_private_1c]
    name          = "${var.vpc_name}-rds-subnet-group"
    subnet_ids    = [aws_subnet.subnet_private_1a.id,aws_subnet.subnet_private_1b.id,aws_subnet.subnet_private_1c.id]
    
    tags = {
      Name = "${var.vpc_name}-rds-subnet-group"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
  }
}

############################################################################################################
# Cache Subnet Operation                                                                                   #
############################################################################################################

resource "aws_elasticache_subnet_group" "elscache_redis_subnet" {
    depends_on = [aws_subnet.subnet_private_1a, aws_subnet.subnet_private_1b, aws_subnet.subnet_private_1c]
    name       = "${var.vpc_name}-elscache-subnet-group"
    subnet_ids    = [aws_subnet.subnet_private_1a.id,aws_subnet.subnet_private_1b.id,aws_subnet.subnet_private_1c.id]
  
    tags = {
      Name = "${var.vpc_name}-elscache-subnet-group"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
  }
}