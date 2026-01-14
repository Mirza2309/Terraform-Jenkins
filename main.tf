terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RGMirza2"
    storage_account_name = "tfstatestoragemirza"
    container_name       = "terraformstatemirza"
    key                  = "mirza-jenkins.tfstate"
  }
}

provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "rg" {
  name     = "mirza-jenkins-rg"
  location = "southeastasia"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "mirza-jenkins-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

