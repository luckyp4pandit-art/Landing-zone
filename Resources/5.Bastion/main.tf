resource "azurerm_bastion_host" "QA_bastion_host" {
    for_each = var.QA_bastion_host
  name                = each.value.bastion_host_name
  location            = each.value.bastion_host_location
  resource_group_name = each.value.bastion_host_resource_group_name

  ip_configuration {
    name                 = each.value.bastion_host_ip_configuration_name
    subnet_id            = data.azurerm_subnet.QA_bastion_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.QA_public_ip[each.key].id
  }
  
}

