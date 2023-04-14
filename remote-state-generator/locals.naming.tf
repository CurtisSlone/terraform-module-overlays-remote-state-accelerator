# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

locals {
  rg_name = azurenoopsutils_resource_name.rg.result
  location            = var.location
  kv_name                = azurenoopsutils_resource_name.kv.result
  sa_name = azurenoopsutils_resource_name.sa.result
  sc_name = azurenoopsutils_resource_name.sc.result
}
