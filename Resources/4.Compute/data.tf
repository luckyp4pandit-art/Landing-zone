data "azurerm_subnet" "QA_nic_subnet" {
    for_each = var.QA_nic
  name                 = each.value.QA_nic_subnet_name
  virtual_network_name = each.value.QA_nic_vnet_name
  resource_group_name  = each.value.QA_nic_resource_group_name
}