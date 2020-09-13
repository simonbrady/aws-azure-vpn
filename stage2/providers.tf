provider "aws" {
  version = "~>3"
  region  = local.region
}

provider "azurerm" {
  version = "~>2"
  features {}
}

provider "random" {
  version = "~>2"
}
