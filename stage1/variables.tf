variable "admin_cidr" {
  type        = string
  description = "CIDR range to allow SSH access from"
}

variable "aws_keypair_name" {
  type        = string
  description = "Name of existing EC2 keypair to use for SSH access"
}

variable "aws_region" {
  type        = string
  description = "Region to deploy AWS resources into"
}

variable "aws_vpc_cidr" {
  type        = string
  description = "CIDR range for AWS VPC"
}

variable "azure_hub_vnet_cidr" {
  type        = string
  description = "CIDR range for Azure hub vnet"
}

variable "azure_location" {
  type        = string
  description = "Location to deploy Azure resources into"
}

variable "azure_spoke_vnet_cidr" {
  type        = string
  description = "CIDR range for Azure spoke vnet"
}

variable "azure_vm_admin_username" {
  type        = string
  description = "Name of local admin user for Azure VM"
}

variable "azure_vm_public_key" {
  type        = string
  description = "Local pathname of public SSH key for Azure VM, relative to stage1 directory"
}

variable "prefix" {
  type        = string
  description = "Common prefix for resource names"
}
