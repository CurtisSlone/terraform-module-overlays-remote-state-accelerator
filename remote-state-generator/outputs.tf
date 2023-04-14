output "resource_group_name" {
  value = azurerm_resource_group.staterg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.tfstatesa.name
}

output "container_name" {
  value = azurerm_storage_container.tfstatesc.name
}

output "client_ID" {
  value = azuread_service_principal.sp.id
}

output "client_secret" {
  value = azuread_application_password.app-pass.value
  sensitive = true
}