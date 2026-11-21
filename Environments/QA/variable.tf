variable "QA_rg" {
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}
variable "QA_vnet" {
  type = map(object({
    vnet_name                = string
    vnet_address_space       = list(string)
    vnet_location            = string
    vnet_resource_group_name = string
    subnet = map(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
  }))
}
variable "QA_public_ip" {
  type = map(object({
    public_ip_name                = string
    public_ip_location            = string
    public_ip_resource_group_name = string
    public_ip_allocation_method   = string
  }))
}
variable "QA_bastion_host" {
  type = map(object({
    bastion_host_name                  = string
    bastion_host_location              = string
    bastion_host_resource_group_name   = string
    bastion_host_ip_configuration_name = string
    QA_bastion_subnet_name             = string
    QA_bastion_vnet_name               = string
    QA_public_ip_name                  = string
    })
  )
}
variable "QA_nic" {
  type = map(object({
    QA_nic_name                            = string
    QA_nic_location                        = string
    QA_nic_resource_group_name             = string
    QA_nic_ip_configuration_name           = string
    QA_nic_subnet_name                     = string
    QA_nic_private_ip_address_allocation   = string
    QA_nic_vnet_name                       = string
    QA_vm_name                             = string
    QA_vm_size                             = string
    QA_vm_os_disk_caching                  = string
    QA_vm_os_disk_storage_account_type     = string
    QA_vm_source_image_reference_publisher = string
    QA_vm_source_image_reference_offer     = string
    QA_vm_source_image_reference_sku       = string
    QA_vm_source_image_reference_version   = string
    QA_vm_admin_username                   = string
    QA_vm_admin_password                   = string


  }))
}
variable "QA_nsg" {
  type = map(object({
    QA_nsg_name                = string
    QA_nsg_location            = string
    QA_nsg_resource_group_name = string
    security_rule = map(object({
      QA_nsg_security_rule_name                       = string
      QA_nsg_security_rule_priority                   = number
      QA_nsg_security_rule_direction                  = string
      QA_nsg_security_rule_access                     = string
      QA_nsg_security_rule_protocol                   = string
      QA_nsg_security_rule_source_port_range          = string
      QA_nsg_security_rule_destination_port_range     = string
      QA_nsg_security_rule_source_address_prefix      = string
      QA_nsg_security_rule_destination_address_prefix = string
    }))

  }))
}
variable "QA_compute_association" {
  type = map(object({
    QA_association_subnet_name         = string
    QA_association_vnet_name           = string
    QA_association_resource_group_name = string
    QA_nsg_name                        = string
  }))
}
variable "QA_mssql_server" {
  type = map(object({
    mssql-server-name                         = string
    mssql-server-resource-group-name          = string
    mssql-server-location                     = string
    mssql-server-version                      = string
    mssql-server-administrator-login          = string
    mssql-server-administrator-login-password = string
  }))
}
variable "QA_mssql_database" {
  type = map(object({
    mssql_database_name              = string
    mssql_server_name                = string
    mssql_server_resource_group_name = string
    mssql_database_collation         = string
    mssql_database_license_type      = string
    mssql_database_max_size_gb       = number
    mssql_database_sku_name          = string
    mssql_database_enclave_type      = string
  }))
}
variable "QA_lb" {
  type = map(object({
    QA_lb_name                           = string
    QA_lb_location                       = string
    QA_lb_resource_group_name            = string
    QA_lb_sku                            = string
    QA_lb_frontend_ip_configuration_name = string
    QA_lb_private_ip_address_allocation  = string
    QA_lb_subnet_name                    = string
    QA_lb_vnet_name                      = string
    QA_lb_backend_address_pool_name      = string
    QA_lb_probe_name                     = string
    QA_lb_probe_protocol                 = string
    QA_lb_probe_port                     = number
    QA_lb_rule_name                      = string
    QA_lb_rule_protocol                  = string
    QA_lb_rule_frontend_port             = number
    QA_lb_rule_backend_port              = number


  }))
}
variable "QA_bp_nic_association" {
  type = map(object({
    nic_ip_configuration_name       = string
    QA_nic_name                     = string
    QA_nic_resource_group_name      = string
    QA_lb_name                      = string
    QA_lb_backend_address_pool_name = string

  }))
}
variable "QA_app_gateway" {
  type = map(object({
    QA_app_gateway_name                                        = string
    QA_app_gateway_location                                    = string
    QA_app_gateway_resource_group_name                         = string
    QA_app_gateway_sku_name                                    = string
    QA_app_gateway_sku_tier                                    = string
    QA_app_gateway_sku_capacity                                = number
    QA_app_gateway_subnet_name                                 = string
    QA_app_gateway_vnet_name                                   = string
    QA_app_gateway_public_ip_name                              = string
    QA_app_gateway_ip_configuration_name                       = string
    QA_app_gateway_frontend_port_name                          = string
    QA_app_gateway_frontend_port                               = number
    QA_app_gateway_backend_address_pool_name                   = string
    QA_app_gateway_backend_http_settings_name                  = string
    QA_app_gateway_backend_http_settings_port                  = number
    QA_app_gateway_backend_http_settings_protocol              = string
    QA_app_gateway_backend_http_settings_cookie_based_affinity = string
    QA_app_gateway_http_listener_name                          = string
    QA_app_gateway_frontend_ip_configuration_name              = string
    QA_app_gateway_http_listener_protocol                      = string
    QA_app_gateway_request_routing_rule_name                   = string
    QA_app_gateway_request_routing_rule_type                   = string
    QA_app_gateway_request_routing_rule_priority               = number


  }))
}


variable "QA_app_gateway_vm_association" {
  type = map(object({
    QA_frontend_vm_nic_name                = string
    QA_frontend_vm_nic_resource_group_name = string
    QA_app_gateway_name                    = string
    QA_nic_ip_configuration_name           = string

  }))
}