
###############################
# Key Vault Configuration   ##
###############################

variable "purge_protection_enabled" {
  description = "Whether to activate purge protection."
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between `7` and `90` days."
  type        = number
  default     = 7
}
