variable "QA_nic" {
  type = map(object({
    QA_nic_name = string
    QA_nic_location = string
    QA_nic_resource_group_name = string
    QA_nic_ip_configuration_name = string
    QA_nic_subnet_name = string
    QA_nic_private_ip_address_allocation = string
    QA_nic_vnet_name = string
    QA_vm_name = string
    QA_vm_size = string
    QA_vm_os_disk_caching = string
    QA_vm_os_disk_storage_account_type = string
    QA_vm_source_image_reference_publisher = string
    QA_vm_source_image_reference_offer = string
    QA_vm_source_image_reference_sku = string
    QA_vm_source_image_reference_version = string
    QA_vm_admin_username = string
    QA_vm_admin_password = string
    

  }))
}