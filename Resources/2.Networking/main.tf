resource "azurerm_virtual_network" "QA_vnet" {
  for_each = var.QA_vnet
    name                = each.value.vnet_name
    address_space       = each.value.vnet_address_space
    location            = each.value.vnet_location
    resource_group_name = each.value.vnet_resource_group_name
  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name = subnet.value.subnet_name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}
