# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

locals {
  default_tags = {
    deployedBy  = format("AzureNoOpsTF [%s]", terraform.workspace)
    environment = var.deploy_environment
    workload    = var.workload_name
  } 
}