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


variable "service_principal_password_end_date" {
  description = "The relative duration or RFC3339 rotation timestamp after which the password expire"
  default     = null
}

variable "service_principal_password_rotation_in_years" {
  description = "Number of years to add to the base timestamp to configure the password rotation timestamp. Conflicts with password_end_date and either one is specified and not the both"
  default     = null
}

variable "service_principal_password_rotation_in_days" {
  description = "Number of days to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation.Conflicts with `password_end_date`, `password_rotation_in_years` and either one must be specified, not all"
  default     = null
}



