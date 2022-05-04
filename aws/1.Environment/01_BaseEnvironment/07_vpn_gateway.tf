
resource "aws_vpn_gateway" "vpn_gw" {
  count = var.vpn_gatewayenable ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-VPNGateway"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_customer_gateway" "customer_gw" {
  count = var.vpn_gatewayenable ? 1 : 0
  bgp_asn    = 65000
  ip_address = var.vpn_publicip
  type       = "ipsec.1"
  tags = {
    Name = "${var.vpc_name}-CustomerGateway"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}

resource "aws_vpn_connection" "vpn_con" {
  count = var.vpn_gatewayenable ? 1 : 0
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw[0].id
  customer_gateway_id = aws_customer_gateway.customer_gw[0].id
  type                = "ipsec.1"
  static_routes_only  = true
  tags = {
    Name = "${var.vpc_name}-VPNConnection"
    Environment = var.tag_environment
    Region      = var.tag_region
    Budget      = var.tag_budget
  }
}