module "mod_remote_state" {
  source = "./remote-state-generator"

    # Globals
    org_name = "anoa"
    location = "useast"
    workload_name = ""
    deploy_environment = ""

    # SPN
    service_principal_name = ""
    alternative_names = ""
    service_principal_description = ""
    service_principal_password_end_date = null
    service_principal_password_rotation_in_years = null
    service_principal_password_rotation_in_days = null

    # KeyVault
    purge_protection_enabled = false
    soft_delete_retention_days = 7


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
