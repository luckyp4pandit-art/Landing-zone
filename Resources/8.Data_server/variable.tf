variable "QA_mssql_server" {
  type = map(object({
    mssql-server-name = string
    mssql-server-resource-group-name = string
    mssql-server-location = string
    mssql-server-version = string
    mssql-server-administrator-login = string
    mssql-server-administrator-login-password = string 
  }))
}