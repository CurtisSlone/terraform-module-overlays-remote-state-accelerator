#------------------------------------------------------------
# Key Vault configuration - Default (required). 
#------------------------------------------------------------
resource "azurerm_key_vault" "keyvault" {
  depends_on = [
    azuread_service_principal.sp
  ]
  # Globals
  name = local.kv_name
  location = local.location
  resource_group_name = local.rg_name
  tenant_id = local.tenant_id
  sku_name = "standard"

  # Keyvault Configurations - Hard Coded
  enabled_for_disk_encryption = false
  enable_rbac_authorization = true
  public_network_access_enabled = false

  # Keyvault Configurations - Vars
  purge_protection_enabled = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days
}