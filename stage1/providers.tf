provider "aws" {
  version = "~>3"
  region  = var.aws_region
}

provider "azurerm" {
  version = "~>2"
  features {}
}

provider "random" {
  version = "~>2"
}
