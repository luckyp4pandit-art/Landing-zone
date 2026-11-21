resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "QA_app_vm_association" {
    for_each = var.QA_app_gateway_vm_association
  network_interface_id    = data.azurerm_network_interface.QA_data_frontend_vm_nic[each.key].id
  ip_configuration_name   = each.value.QA_nic_ip_configuration_name
  backend_address_pool_id = data.azurerm_application_gateway.QA_data_app_gateway[each.key].backend_address_pool[0].id
}
