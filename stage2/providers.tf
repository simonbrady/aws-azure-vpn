terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = local.region
}

provider "azurerm" {
  features {}
}

provider "random" {}
