resource "azurerm_local_network_gateway" "aws" {
  name                = "${local.prefix}-lgw"
  location            = local.location
  resource_group_name = local.resource_group_name
  gateway_address     = aws_vpn_connection.azure.tunnel1_address
  address_space       = [local.aws_vpc_cidr]
}

resource "azurerm_virtual_network_gateway_connection" "aws" {
  name                       = "${local.prefix}-conn"
  location                   = local.location
  resource_group_name        = local.resource_group_name
  type                       = "IPsec"
  virtual_network_gateway_id = local.virtual_network_gateway_id
  local_network_gateway_id   = azurerm_local_network_gateway.aws.id
  shared_key                 = local.shared_key
}

resource "azurerm_local_network_gateway" "aws2" {
  name                = "${local.prefix}-lgw-2"
  location            = local.location
  resource_group_name = local.resource_group_name
  gateway_address     = aws_vpn_connection.azure.tunnel2_address
  address_space       = [local.aws_vpc_cidr]
}

resource "azurerm_virtual_network_gateway_connection" "aws2" {
  name                       = "${local.prefix}-conn-2"
  location                   = local.location
  resource_group_name        = local.resource_group_name
  type                       = "IPsec"
  virtual_network_gateway_id = local.virtual_network_gateway_id
  local_network_gateway_id   = azurerm_local_network_gateway.aws2.id
  shared_key                 = local.shared_key
}
