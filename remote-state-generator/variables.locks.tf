# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

####################################
# Resource Locks Configuration    ##
####################################

variable "enable_resource_locks" {
  description = "(Optional) Enable resource locks"
  type        = bool
  default     = false
}

variable "lock_level" {
  description = "(Optional) id locks are enabled, Specifies the Level to be used for this Lock."
  type        = string
  default     = "CanNotDelete"
}