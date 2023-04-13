#
# Network Artifacts Storage Account
#

resource "azurerm_storage_account" "tfstatesa" {
  depends_on = [
    module.mod_network_artifacts_rg
  ]
  name                     = "${lower(var.org_name)}tfstatesa${random_string.tf-name.result}"
  resource_group_name      = module.mod_network_artifacts_rg.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = true
  
}

#
# Network Artifacts Container
#

resource "azurerm_storage_container" "tfstatesc" {
  depends_on = [
    azurerm_storage_account.tfstatesa
  ]
  name                  = "${lower(var.org_name)}tfstatesc${random_string.tf-name.result}"
  storage_account_name  = azurerm_storage_account.tfstatesa.name
  container_access_type = "private"
}
