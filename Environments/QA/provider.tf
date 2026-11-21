terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ashrgdonotdelete"
    storage_account_name = "vmo2store"
    container_name       = "vmcontainer"
    key                  = "sapna.tfstate"
  }
}

provider "azurerm" {
  features {}

}