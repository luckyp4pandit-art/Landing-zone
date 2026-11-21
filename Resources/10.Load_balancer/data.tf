data "azurerm_subnet" "QA_lb_subnet" {
    for_each = var.QA_lb
  name                 = each.value.QA_lb_subnet_name
  virtual_network_name = each.value.QA_lb_vnet_name
  resource_group_name  = each.value.QA_lb_resource_group_name
}