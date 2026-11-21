data "azurerm_mssql_server" "QA_sql_server" {
    for_each = var.QA_mssql_database
  name                = each.value.mssql_server_name
  resource_group_name = each.value.mssql_server_resource_group_name
}