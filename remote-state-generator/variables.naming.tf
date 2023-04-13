# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Generic naming variables
variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name"
  type        = string
  default     = ""
}

variable "use_naming" {
  description = "Use the Azure CAF naming provider to generate default resource name. `custom_name` override this if set. Legacy default name is used if this is set to `false`."
  type        = bool
  default     = true
}

# Custom naming override
variable "custom_name" {
  description = "Name of the Key Vault, generated if not set."
  type        = string
  default     = ""
}

variable "custom_resource_group_name" {
    description = "(Optional) Custom name for the resource group. If not set, the module will generate a name based on the workload_name, environment and org_name."
    type = string
    default = null
}