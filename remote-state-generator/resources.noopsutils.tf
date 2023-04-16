# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Resource Group NoOpsUtils
resource "azurenoopsutils_resource_name" "rg" {
    name = "resourcegroup"
    resource_type = "azurerm_resource_group"
    prefixes        = [var.org_name, local.environment,var.workload_name]
    suffixes        = []
    random_length = 5
    clean_input = true
    separator     = "-"
}

# Storage Account NoOpsUtils
resource "azurenoopsutils_resource_name" "sa" {
    name = "sa"
    resource_type = "azurerm_storage_account"
     prefixes        = [var.org_name, local.environment,var.workload_name]
    suffixes        = []
    random_length = 5
    clean_input = true
}

# Storage Container NoOpsUtils
resource "azurenoopsutils_resource_name" "sc" {
    name = "sc"
    resource_type = "azurerm_storage_container"
     prefixes        = [var.org_name, local.environment,var.workload_name]
    suffixes        = []
    random_length = 5
    clean_input = true
}