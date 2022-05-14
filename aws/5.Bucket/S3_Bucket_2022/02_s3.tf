resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_name
  tags = {
      Name        = var.s3_name
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
      }
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.s3_acl
}

resource "aws_s3_bucket_accelerate_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  status = var.s3_acceleration
}