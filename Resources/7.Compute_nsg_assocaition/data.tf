data "azurerm_subnet" "QA_association_subnet" {
    for_each = var.QA_compute_association
  name                 = each.value.QA_association_subnet_name
  virtual_network_name = each.value.QA_association_vnet_name
  resource_group_name  = each.value.QA_association_resource_group_name
}
data "azurerm_network_security_group" "QA_association_nsg" {
  for_each = var.QA_compute_association
  name                = each.value.QA_nsg_name
  resource_group_name = each.value.QA_association_resource_group_name
}