# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Resource Group NoOpsUtils
resource "azurenoopsutils_resource_name" "rg" {
    name = "stategroup"
    resource_type = "azurerm_resource_group"
    prefixes        = [var.org_name, var.deploy_environment,var.workload_name]
    suffixes        = []
    random_length = 5
    clean_input = true
    separator     = "-"
}

# KeyVault NoOpsUtils
resource "azurenoopsutils_resource_name" "kv" {
    name = "statekv"
    resource_type = "azurerm_key_vault"
     prefixes        = [var.org_name, var.deploy_environment,var.workload_name]
    suffixes        = []
    random_length = 5
    clean_input = true
}

# Storage Account NoOpsUtils
resource "azurenoopsutils_resource_name" "sa" {
    name = "statesa"
    resource_type = "azurerm_storage_account"
     prefixes        = [var.org_name, var.deploy_environment,var.workload_name]
    suffixes        = []
    random_length = 5
    clean_input = true
}

# Storage Container NoOpsUtils
resource "azurenoopsutils_resource_name" "sc" {
    name = "statesc"
    resource_type = "azurerm_storage_container"
     prefixes        = [var.org_name, var.deploy_environment,var.workload_name]
    suffixes        = []
    random_length = 5
    clean_input = true
}