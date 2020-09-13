data "terraform_remote_state" "stage1" {
  backend = "local"
  config = {
    path = "${path.module}/../stage1/terraform.tfstate"
  }
}

# Import stage 1 outputs as locals for ease of reference
locals {
  aws_vpc_cidr                   = data.terraform_remote_state.stage1.outputs.aws_vpc_cidr
  azure_spoke_vnet_cidr          = data.terraform_remote_state.stage1.outputs.azure_spoke_vnet_cidr
  bgp_asn                        = data.terraform_remote_state.stage1.outputs.bgp_asn
  location                       = data.terraform_remote_state.stage1.outputs.location
  prefix                         = data.terraform_remote_state.stage1.outputs.prefix
  public_ip_name                 = data.terraform_remote_state.stage1.outputs.public_ip_name
  region                         = data.terraform_remote_state.stage1.outputs.region
  resource_group_name            = data.terraform_remote_state.stage1.outputs.resource_group_name
  transit_gateway_id             = data.terraform_remote_state.stage1.outputs.transit_gateway_id
  transit_gateway_route_table_id = data.terraform_remote_state.stage1.outputs.transit_gateway_route_table_id
  virtual_network_gateway_id     = data.terraform_remote_state.stage1.outputs.virtual_network_gateway_id
}

data "azurerm_public_ip" "vpn" {
  name                = local.public_ip_name
  resource_group_name = local.resource_group_name
}
