resource "aws_route53_zone" "route53" {
  name       = var.route53_name
  depends_on = [aws_vpc.vpc]
  vpc {
      vpc_id = aws_vpc.vpc.id
      vpc_region = var.region
   }
  tags = {
    Name = var.route53_name
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}