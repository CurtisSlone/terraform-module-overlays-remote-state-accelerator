#------------------------------------------------------------
# Key Vault configuration - Default (required). 
#------------------------------------------------------------
resource "azurerm_key_vault" "keyvault" {
  
  # Globals
  name = local.kv_name
  location = local.location
  resource_group_name = local.rg_name
  tenant_id = local.tenant_id
  sku_name = "standard"

  # Keyvault Configurations - Hard Coded
  enabled_for_disk_encryption = false
  enable_rbac_authorization = false
  public_network_access_enabled = true

  # Keyvault Configurations - Vars
  purge_protection_enabled = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  access_policy {
    
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    
    key_permissions = [
        "Get",
        "List",
        "Create",
        "Delete",
        "Purge"
    ]
    secret_permissions = [
        "Get",
        "List",
        "Set",
        "Delete",
        "Purge",
        "Recover"

        ]

        storage_permissions = [
        "Get",
        "GetSAS",
        "SetSAS",
        "Delete",
        "Purge"

        ]
  }
}