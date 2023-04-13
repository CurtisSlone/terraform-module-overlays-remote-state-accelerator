# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# App Registration
resource "azuread_application" "app" {
  display_name     = var.service_principal_name
  sign_in_audience = "AzureADMyOrg"
}

# SPN Assignment To App Registration
resource "azuread_service_principal" "sp" {
  application_id    = azuread_application.app.application_id
  alternative_names = var.alternative_names
  description       = var.service_principal_description
}

# SPN Roles
resource "azurerm_role_assignment" "role" {
  name                 = "SubscriptionContributor"
  description          = "Current Subscription Contributor Role"
  scope = "subscriptions/${data.azurerm_client_config.current.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.sp.object_id
}

# SPN Password Time Rotation Rules
resource "time_rotating" "main" {
  rotation_rfc3339 = var.service_principal_password_end_date
  rotation_years   = var.service_principal_password_rotation_in_years
  rotation_days    = var.service_principal_password_rotation_in_days

  triggers = {
    end_date = var.service_principal_password_end_date
    years    = var.service_principal_password_rotation_in_years
    days     = var.service_principal_password_rotation_in_days
  }
}

# SPN Password 
resource "azuread_service_principal_password" "sp_password" {
  service_principal_id = azuread_service_principal.sp.object_id
  rotate_when_changed = {
    rotation = time_rotating.main.id
  }
}