resource "azurerm_public_ip" "QA_public_ip" {
  for_each = var.QA_public_ip
    name                = each.value.public_ip_name
    location            = each.value.public_ip_location
    resource_group_name = each.value.public_ip_resource_group_name
    allocation_method   = each.value.public_ip_allocation_method
  
}
