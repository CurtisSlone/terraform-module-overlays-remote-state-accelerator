#------------------------------------------------------------
# Key Vault configuration - Default (required). 
#------------------------------------------------------------
resource "azurerm_key_vault" "keyvault" {
  
  depends_on = [
    azurerm_resource_group.staterg
  ]
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
}

# Remote State Creator Perms
resource "azurerm_key_vault_access_policy" "admin_policy" {
  depends_on = [
    azurerm_key_vault.keyvault
  ]

   tenant_id = local.tenant_id
   object_id = data.azurerm_client_config.current.object_id
   key_vault_id = azurerm_key_vault.keyvault.id 

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
 
# SPN Policy
resource "azurerm_key_vault_access_policy" "spn_policy" {
  depends_on = [
    azurerm_key_vault.keyvault,
    azuread_application.app
  ]

  object_id = azuread_application.app.object_id
  tenant_id = local.tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

 key_permissions = [
        "Get",
        "List"
    ]
    secret_permissions = [
        "Get",
        "List"
        ]

    storage_permissions = [
    "Get",
    "GetSAS",
    "List",
    "ListSAS"
    ]
}



# KeyVault Secret
resource "azurerm_key_vault_secret" "tfstatekvsecret" {
  depends_on = [
    azurerm_storage_container.tfstatesc,
    azurerm_key_vault_access_policy.admin_policy
  ]

  name = "tfstatesakey"
  value = azurerm_storage_account.tfstatesa.primary_access_key
  key_vault_id = azurerm_key_vault.keyvault.id
}