# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  resource_group_name = ""
  #element(coalescelist(data.azurerm_resource_group.rgrp.*.name, module.mod_key_vault_rg.*.resource_group_name, [""]), 0)
  location            = ""
  #element(coalescelist(data.azurerm_resource_group.rgrp.*.location, module.mod_key_vault_rg.*.resource_group_location, [""]), 0)
  kv_name                = coalesce(var.custom_name, data.azurenoopsutils_resource_name.keyvault.result)
  sa_name = "" #coalesce()
}
