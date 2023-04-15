resource "azurerm_key_vault_secret" "tfstatekvsecret" {
  depends_on = [
    azurerm_key_vault.keyvault,
    azurerm_storage_account.tfstatesa
  ]
  name = "tfstatesakey"
  value = azurerm_storage_account.tfstatesa.primary_access_key
  key_vault_id = azurerm_key_vault.keyvault.id
}