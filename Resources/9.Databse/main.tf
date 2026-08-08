resource "azurerm_mssql_database" "QA_db" {
  for_each     = var.QA_mssql_database
  name         = each.value.mssql_database_name
  server_id    = data.azurerm_mssql_server.QA_sql_server[each.key].id
  collation    = each.value.mssql_database_collation
  license_type = each.value.mssql_database_license_type
  max_size_gb  = each.value.mssql_database_max_size_gb
  sku_name     = each.value.mssql_database_sku_name
  enclave_type = each.value.mssql_database_enclave_type

}

