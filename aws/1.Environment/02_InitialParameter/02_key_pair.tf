//Create KeyPair
resource "aws_key_pair" "keypair" {
  key_name   = "${var.vpc_name}-keypair"
  public_key = var.public_key
}