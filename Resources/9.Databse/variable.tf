variable "QA_mssql_database" {
  type = map(object({
    mssql_database_name                = string
    mssql_server_name                  = string
    mssql_server_resource_group_name   = string
    mssql_database_collation           = string
    mssql_database_license_type        = string
    mssql_database_max_size_gb         = number
    mssql_database_sku_name            = string
    mssql_database_enclave_type          = string
  }))
}