#
# Network Artifacts Storage Account
#

resource "azurerm_storage_account" "tfstatesa" {
  depends_on = [
    azurerm_resource_group.staterg
  ]
  name                     = local.sa_name
  resource_group_name      = local.rg_name
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
  name                  = local.sc_name
  storage_account_name  = azurerm_storage_account.tfstatesa.name
  container_access_type = "private"
}
