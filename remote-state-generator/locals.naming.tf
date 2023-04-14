# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

locals {
   # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)
  rg_name = azurenoopsutils_resource_name.rg.result
  location            = var.location
  kv_name                = azurenoopsutils_resource_name.kv.result
  sa_name = azurenoopsutils_resource_name.sa.result
  sc_name = azurenoopsutils_resource_name.sc.result
}
