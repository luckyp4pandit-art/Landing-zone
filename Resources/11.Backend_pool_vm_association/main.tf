resource "azurerm_network_interface_backend_address_pool_association" "QA_bp_nic_association" {
    for_each = var.QA_bp_nic_association
  network_interface_id    = data.azurerm_network_interface.QA_data_nic[each.key].id
  ip_configuration_name   = each.value.nic_ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.QA_data_backend_pool[each.key].id
  
}


