resource "azurerm_network_interface" "QA_nic" {
    for_each = var.QA_nic
  name                = each.value.QA_nic_name
  location            = each.value.QA_nic_location
  resource_group_name = each.value.QA_nic_resource_group_name

  ip_configuration {
    name                          = each.value.QA_nic_ip_configuration_name
    subnet_id                     = data.azurerm_subnet.QA_nic_subnet[each.key].id
    
    private_ip_address_allocation = each.value.QA_nic_private_ip_address_allocation
    
  }
  
}

resource "azurerm_linux_virtual_machine" "QA_vm" {
    for_each = var.QA_nic
  name                = each.value.QA_vm_name
  location            = each.value.QA_nic_location
  resource_group_name = each.value.QA_nic_resource_group_name
  
  network_interface_ids = [
    azurerm_network_interface.QA_nic[each.key].id
  ]
  size                = each.value.QA_vm_size

  os_disk {
    caching              = each.value.QA_vm_os_disk_caching
    storage_account_type = each.value.QA_vm_os_disk_storage_account_type
    
  }

  source_image_reference {
    publisher = each.value.QA_vm_source_image_reference_publisher
    offer     = each.value.QA_vm_source_image_reference_offer
    sku       = each.value.QA_vm_source_image_reference_sku
    version   = each.value.QA_vm_source_image_reference_version
  }

  admin_username      = each.value.QA_vm_admin_username
  admin_password      = each.value.QA_vm_admin_password
  disable_password_authentication = false
  
}

