# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Readers Policy
resource "azurerm_key_vault_access_policy" "readers_policy" {
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
    "GetSAS"
    ]
}

