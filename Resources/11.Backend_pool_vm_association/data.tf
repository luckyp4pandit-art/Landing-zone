data "azurerm_network_interface" "QA_data_nic" {
    for_each = var.QA_bp_nic_association
  name                = each.value.QA_nic_name
  resource_group_name = each.value.QA_nic_resource_group_name
}
data "azurerm_lb_backend_address_pool" "QA_data_backend_pool" {
    for_each = var.QA_bp_nic_association
  name            = each.value.QA_lb_backend_address_pool_name
  loadbalancer_id = data.azurerm_lb.QA_data_lb[each.key].id
}
data "azurerm_lb" "QA_data_lb" {
    for_each = var.QA_bp_nic_association
  name                = each.value.QA_lb_name
  resource_group_name = each.value.QA_nic_resource_group_name
}