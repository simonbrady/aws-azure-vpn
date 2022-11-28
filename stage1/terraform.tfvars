# Shared
prefix     = "aws-az-vpn"
admin_cidr = "127.0.0.1/32" # Change to your IP range

# AWS
aws_region       = "ap-southeast-2"
aws_keypair_name = "some-existing-keypair"
aws_vpc_cidr     = "10.1.0.0/16"

# Azure
azure_location          = "Australia East"
azure_hub_vnet_cidr     = "10.2.0.0/16"
azure_spoke_vnet_cidr   = "10.3.0.0/16"
azure_vm_admin_username = "adminuser"
azure_vm_public_key     = "../azure-vm-rsa.pub"
