module "mod_rg2" {
    source = "azurenoops/overlays-resource-group/azurerm"
    version = "~> 1.0"

    //Resource Group Configuration
    location = "eastus"
    org_name = "anoa"
    environment = "dev"
    workload_name = "test-rg2"
    use_location_short_name = false
    custom_rg_name = var.custom_resource_group_name != null ? var.custom_resource_group_name : null

    //Resource Locks
    enable_resource_locks = var.enable_resource_locks
    lock_level = var.lock_level

    //Tags
    add_tags = {}
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