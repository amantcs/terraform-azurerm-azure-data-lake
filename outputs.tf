output "id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.this.name
}

output "primary_location" {
  description = "The primary location of the storage account."
  value       = azurerm_storage_account.this.primary_location
}

output "primary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "primary_dfs_endpoint" {
  description = "The endpoint URL for DFS (Data Lake Storage Gen2) in the primary location."
  value       = azurerm_storage_account.this.primary_dfs_endpoint
}

output "primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
}

output "primary_connection_string" {
  description = "The connection string associated with the primary location."
  value       = azurerm_storage_account.this.primary_connection_string
  sensitive   = true
}
