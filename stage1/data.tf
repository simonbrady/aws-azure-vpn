data "aws_ami" "ubuntu" {
  owners      = ["099720109477"] # Canonical
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

data "azurerm_public_ip" "vm" {
  # IP address is dynamically allocated only when the VM is created
  depends_on          = [azurerm_linux_virtual_machine.vm]
  name                = azurerm_public_ip.vm.name
  resource_group_name = azurerm_public_ip.vm.resource_group_name
}
