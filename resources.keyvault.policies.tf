# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Readers Policy
resource "azurerm_key_vault_access_policy" "readers_policy" {
  
  object_id = ""
  tenant_id = local.tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  key_permissions = [
    "Get",
    "List",
  ]

  secret_permissions = [
    "Get",
    "List",
  ]

  certificate_permissions = [
    "Get",
    "List",
  ]
}

# Admins Policy
resource "azurerm_key_vault_access_policy" "admin_policy" {
  
  object_id = data.azuread_client_config.current.object_id
  tenant_id = local.tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  
  key_permissions = [
    "Backup",
    "Create",
    "Decrypt",
    "Delete",
    "Encrypt",
    "Get",
    "Import",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Sign",
    "UnwrapKey",
    "Update",
    "Verify",
    "WrapKey",
  ]

  secret_permissions = [
    "Backup",
    "Delete",
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set",
  ]

  certificate_permissions = [
    "Backup",
    "Create",
    "Delete",
    "DeleteIssuers",
    "Get",
    "GetIssuers",
    "Import",
    "List",
    "ListIssuers",
    "ManageContacts",
    "ManageIssuers",
    "Purge",
    "Recover",
    "Restore",
    "SetIssuers",
    "Update",
  ]
}