resource "azurerm_resource_group" "staterg" {
  name = "rg-1"
  location = "eastus"
  tags = {}
}


# Versions

terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.22"
    }
    azurenoopsutils = {
      source  = "azurenoops/azurenoopsutils"
      version = "~> 1.0"
    }
  }

  backend "azurerm" { }
}

provider "azurerm" {
  features {}
}