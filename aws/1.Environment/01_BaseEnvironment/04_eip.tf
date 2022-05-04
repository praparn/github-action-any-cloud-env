resource "aws_eip" "scblf_eipnat_1a" {
  vpc = true

  tags = {
    Name = "${var.vpc_name}-EIP1A"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_eip" "scblf_eipnat_1b" {
  vpc = true

  tags = {
    Name = "${var.vpc_name}-EIP1B"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_eip" "scblf_eipnat_1c" {
  vpc = true

  tags = {
    Name = "${var.vpc_name}-EIP1C"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}