#
# Remote State Resource Group
#

module "mod_rg" {
    source = "azurenoops/overlays-resource-group/azurerm"
    version = "~> 1.0"

    //Resource Group Configuration
    location = var.location
    org_name = var.org_name
    environment = var.environment
    workload_name = var.workload_name
    use_location_short_name = var.use_location_short_name
    custom_rg_name = var.custom_resource_group_name != null ? var.custom_resource_group_name : null

    //Resource Locks
    enable_resource_locks = var.enable_resource_locks
    lock_level = var.lock_level

    //Tags
    add_tags = var.tags 
}