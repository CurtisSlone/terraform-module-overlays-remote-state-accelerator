# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# App Registration
resource "azuread_application" "app" {
  depends_on = [
    azurerm_resource_group.staterg
  ]
  display_name     = var.service_principal_name
}

# App Registration Password
resource "azuread_application_password" "app-pass" {
  application_object_id = azuread_application.app.object_id
}

# SPN Assignment To App Registration
resource "azuread_service_principal" "sp" {
  depends_on = [
    azuread_application.app
  ]
  
  application_id    = azuread_application.app.application_id
  alternative_names = var.alternative_names
  description       = var.service_principal_description
}

# SPN Roles
resource "azurerm_role_assignment" "role" {
  depends_on = [
    azuread_service_principal.sp
  ]

  description          = "Current Subscription Contributor Role"
  scope = local.subscription_id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.sp.id

}
 