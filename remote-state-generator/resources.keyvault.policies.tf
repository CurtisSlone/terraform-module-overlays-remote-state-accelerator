# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Readers Policy
resource "azurerm_key_vault_access_policy" "readers_policy" {
  depends_on = [
    azurerm_key_vault.keyvault
  ]
  object_id = azuread_application.app.object_id
  tenant_id = local.tenant_id
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

# Admins Policy
resource "azurerm_key_vault_access_policy" "admin_policy" {
  depends_on = [
    azurerm_key_vault.keyvault
  ]
  object_id = data.azuread_client_config.current.object_id
  tenant_id = local.tenant_id
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