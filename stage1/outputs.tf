# Outputs for human consumption
output "aws_vm_private_ip" {
  value = aws_instance.vm.private_ip
}

output "aws_vm_public_ip" {
  value = aws_instance.vm.public_ip
}

output "azure_vm_admin_password" {
  value = random_password.admin.result
}

output "azure_vm_private_ip" {
  value = azurerm_network_interface.vm.private_ip_address
}

output "azure_vm_public_ip" {
  value = data.azurerm_public_ip.vm.ip_address
}

# Outputs passed to stage 2
output "aws_vpc_cidr" {
  value = var.aws_vpc_cidr
}

output "azure_spoke_vnet_cidr" {
  value = var.azure_spoke_vnet_cidr
}

output "bgp_asn" {
  value = azurerm_virtual_network_gateway.vpn.bgp_settings[0].asn
}

output "location" {
  value = var.azure_location
}

output "prefix" {
  value = var.prefix
}

output "public_ip_name" {
  value = azurerm_public_ip.vpn.name
}

output "region" {
  value = var.aws_region
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.tgw.id
}

output "transit_gateway_route_table_id" {
  value = aws_ec2_transit_gateway.tgw.association_default_route_table_id
}

output "virtual_network_gateway_id" {
  value = azurerm_virtual_network_gateway.vpn.id
}
