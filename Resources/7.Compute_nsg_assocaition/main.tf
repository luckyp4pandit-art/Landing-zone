resource "azurerm_subnet_network_security_group_association" "QA_nsg_association" {
    for_each = var.QA_compute_association
  subnet_id = data.azurerm_subnet.QA_association_subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.QA_association_nsg[each.key].id
  
}



