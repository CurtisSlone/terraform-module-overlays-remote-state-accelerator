module "mod_remote_state" {
  source = "./remote-state-generator"

    # Globals
    org_name = "anoa"
    location = "eastus"
    workload_name = "remote-state"
    deploy_environment = "dev"

    # SPN
    service_principal_name = "subscription-spn"
    alternative_names = []
    service_principal_description = "Updates subscription and TF workspaces"

    # KeyVault
    purge_protection_enabled = false
    soft_delete_retention_days = 7


}

#Outputs
output "resource_group_name" {
  value = module.mod_remote_state.resource_group_name
}

output "storage_account_name" {
  value = module.mod_remote_state.storage_account_name
}

output "container_name" {
  value = module.mod_remote_state.container_name
}

output "client_ID" {
  value = module.mod_remote_state.client_ID
}

output "client_secret" {
  value = module.mod_remote_state.client_secret
  sensitive = true
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
}

provider "azurerm" {
  features {}
}