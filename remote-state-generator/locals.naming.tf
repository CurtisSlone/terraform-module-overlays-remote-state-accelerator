# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

locals {
  rg_name = azurenoopsutils_resource_name.rg.result
  location            = var.location
  environment = "state"
  kv_name                = "${var.org_name}statekv${random_string.rand.result}"
  sa_name = azurenoopsutils_resource_name.sa.result
  sc_name = azurenoopsutils_resource_name.sc.result
}
