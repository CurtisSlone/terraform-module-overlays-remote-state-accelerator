# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# TFState Resource Group
resource "azurerm_resource_group" "staterg" {
  name = local.rg_name
  location = var.location
  tags = var.add_tags
}