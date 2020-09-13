# IPsec shared key can't start with digit 0
resource "random_password" "first_letter" {
  length  = 1
  number  = false
  special = false
}

resource "random_password" "remainder" {
  length           = 31
  override_special = "._"
}

locals {
  shared_key = "${random_password.first_letter.result}${random_password.remainder.result}"
}

# # Resources that require the Azure VPN gateway to exist with a public IP address should be
# # able to depend on it directly, but experience shows this is unreliable (some sort of race
# # condition in gateway resource creation that probably requires a provider fix). So instead
# # we insert a post-creation delay for downstream resources to depend on which gives time
# # for the gateway to stabilise.
# resource "time_sleep" "gateway_creation_delay" {
#   depends_on = [azurerm_virtual_network_gateway.vpn]
#   create_duration = "60s"
# }
