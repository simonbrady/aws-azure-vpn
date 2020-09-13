resource "aws_customer_gateway" "azure" {
  bgp_asn    = local.bgp_asn
  ip_address = data.azurerm_public_ip.vpn.ip_address
  type       = "ipsec.1"
  tags = {
    Name = "${local.prefix}-cgw"
  }
}

resource "aws_vpn_connection" "azure" {
  transit_gateway_id    = local.transit_gateway_id
  customer_gateway_id   = aws_customer_gateway.azure.id
  type                  = aws_customer_gateway.azure.type
  static_routes_only    = true
  tunnel1_preshared_key = local.shared_key
  tunnel2_preshared_key = local.shared_key
  tags = {
    Name = "${local.prefix}-conn"
  }
}

resource "aws_ec2_transit_gateway_route" "azure" {
  destination_cidr_block         = local.azure_spoke_vnet_cidr
  transit_gateway_attachment_id  = aws_vpn_connection.azure.transit_gateway_attachment_id
  transit_gateway_route_table_id = local.transit_gateway_route_table_id
}
