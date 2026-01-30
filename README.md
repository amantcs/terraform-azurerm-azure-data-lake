# Azure Data Lake Storage Gen2 (ADLS) Terraform Module

This module creates an Azure Storage Account with Hierarchical Namespace (HNS) enabled, suitable for Data Lake Storage Gen2 workloads.

## Features

- Creates an Azure Storage Account.
- Enables Hierarchical Namespace (ADLS Gen2).
- Configurable SKU (Tier, Replication), Access Tier, and Location.
- Outputs commonly used attributes like Endpoints and Access Keys.

## Usage

```hcl
module "adls" {
  source = "./" # Or the path to where this module is located

  resource_group_name      = "my-resource-group"
  location                 = "East US"
  storage_account_name     = "myadlsstorageacct"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"

  tags = {
    Environment = "Dev"
    Project     = "DataLake"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | The name of the resource group in which the storage account will be created. | `string` | n/a | yes |
| location | The Azure region where the storage account should be created. | `string` | n/a | yes |
| storage_account_name | The name of the storage account. Must be unique, 3-24 chars, lowercase letters and numbers only. | `string` | n/a | yes |
| account_tier | The Tier to use for this storage account. (Standard/Premium) | `string` | `Standard` | no |
| account_replication_type | The type of replication to use. (LRS, GRS, ZRS, etc.) | `string` | `LRS` | no |
| account_kind | The kind of Storage Account. | `string` | `StorageV2` | no |
| access_tier | The access tier for the storage account. (Hot/Cool) | `string` | `Hot` | no |
| tags | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Storage Account. |
| name | The name of the Storage Account. |
| primary_location | The primary location of the storage account. |
| primary_blob_endpoint | The endpoint URL for blob storage. |
| primary_dfs_endpoint | The endpoint URL for DFS (ADLS Gen2). |
| primary_access_key | The primary access key. (Sensitive) |
| primary_connection_string | The connection string. (Sensitive) |
