resource "aws_security_group" "rds_secgroup" {
  name        = "${var.rds_prefixname}-secgroup"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "${var.rds_prefixname}-secgroup"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
  }
}