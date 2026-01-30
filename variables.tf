variable "resource_group_name" {
  description = "The name of the resource group in which the storage account will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account should be created."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account. Must be unique across all existing storage account names in Azure. It must be 3 to 24 characters long, and can contain only lowercase letters and numbers."
  type        = string

  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24 && can(regex("^[a-z0-9]*$", var.storage_account_name))
    error_message = "The storage account name must be between 3 and 24 characters long and can only contain lowercase letters and numbers."
  }
}

variable "account_tier" {
  description = "The Tier to use for this storage account. Valid options are Standard and Premium."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "The account_tier must be either 'Standard' or 'Premium'."
  }
}

variable "account_replication_type" {
  description = "The type of replication to use for this storage account. Valid options depend on the Account Tier."
  type        = string
  default     = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "The account_replication_type must be one of: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }
}

variable "account_kind" {
  description = "The kind of Storage Account. Valid options are StorageV2, BlobStorage, BlockBlobStorage, FileStorage, Storage."
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "The access tier for the storage account. Valid options are Hot and Cool."
  type        = string
  default     = "Hot"

  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "The access_tier must be either 'Hot' or 'Cool'."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
