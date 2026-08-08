data "azurerm_network_interface" "QA_data_frontend_vm_nic" {
    for_each = var.QA_app_gateway_vm_association
  name                = each.value.QA_frontend_vm_nic_name
  resource_group_name = each.value.QA_frontend_vm_nic_resource_group_name

}
data "azurerm_application_gateway" "QA_data_app_gateway" {
    for_each = var.QA_app_gateway_vm_association
  name                = each.value.QA_app_gateway_name
  resource_group_name = each.value.QA_frontend_vm_nic_resource_group_name
}
