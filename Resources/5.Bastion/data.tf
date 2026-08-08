data "azurerm_subnet" "QA_bastion_subnet" {
    for_each = var.QA_bastion_host
  name                 = each.value.QA_bastion_subnet_name
  virtual_network_name = each.value.QA_bastion_vnet_name
  resource_group_name  = each.value.bastion_host_resource_group_name
}
data "azurerm_public_ip" "QA_public_ip" {
    for_each = var.QA_bastion_host
  name                = each.value.QA_public_ip_name
  resource_group_name = each.value.bastion_host_resource_group_name
}