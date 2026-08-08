data "azurerm_subnet" "QA_application_subnet" {
    for_each = var.QA_app_gateway
  name                 = each.value.QA_app_gateway_subnet_name
  virtual_network_name = each.value.QA_app_gateway_vnet_name
  resource_group_name  = each.value.QA_app_gateway_resource_group_name
}
data "azurerm_public_ip" "QA_public_ip" {
    for_each = var.QA_app_gateway
  name                = each.value.QA_app_gateway_public_ip_name
  resource_group_name = each.value.QA_app_gateway_resource_group_name
}