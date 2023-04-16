# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "service_principal_name" {
  description = "The name of the service principal"
  default     = ""
}

variable "alternative_names" {
  type        = list(string)
  description = "(Optional) A set of alternative names, used to retrieve service principals by subscription, identify resource group and full resource ids for managed identities."
  default     = []
}

variable "service_principal_description" {
  description = "A description of the service principal provided for internal end-users."
  default     = "Updates subscription and TF workspaces"
}
