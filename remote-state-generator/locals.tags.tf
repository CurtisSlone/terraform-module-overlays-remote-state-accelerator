# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

locals {
  default_tags = var.default_tags_enabled ? {
    deployedBy  = format("AzureNoOpsTF [%s]", terraform.workspace)
    environment = var.environment
    workload    = var.workload_name
  } : {}
}