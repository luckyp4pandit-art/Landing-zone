resource "azurerm_mssql_server" "QA_mssql_server" {
    for_each = var.QA_mssql_server
  name                         = each.value.mssql-server-name
  resource_group_name          = each.value.mssql-server-resource-group-name
  location                     = each.value.mssql-server-location
  version                      = each.value.mssql-server-version
  administrator_login          = each.value.mssql-server-administrator-login
  administrator_login_password = each.value.mssql-server-administrator-login-password
  
}
