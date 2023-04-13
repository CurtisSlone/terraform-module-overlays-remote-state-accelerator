# Licensed under the MIT License.
#---------------------------------------------------------------
# Resource Group Creation
#----------------------------------------------------------------
# Azure Region Lookup. This module will lookup the Azure Region and return the short name for the region
module "mod_azure_region_lookup" {
  source = "azurenoops/overlays-azregions-lookup/azurerm"
  version = "~> 1.0"

  azure_region = var.location
}

resource "azurerm_resource_group" "main_rg" {
  name     = local.rg_name
  location = var.location

  tags = merge(local.default_tags, var.add_tags)
}
