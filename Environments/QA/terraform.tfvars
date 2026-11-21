QA_rg = {
  "rg1" = {
    rg_name     = "QA_rg"
    rg_location = "australiaeast"
  }
}
QA_vnet = {
  "vnet1" = {
    vnet_name                = "QA_vnet"
    vnet_address_space       = ["10.0.0.0/16"]
    vnet_location            = "australiaeast"
    vnet_resource_group_name = "QA_rg"
    subnet = {
      "subnet1" = {
        subnet_name      = "QA_frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      "subnet2" = {
        subnet_name      = "QA_backend_subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
      "subnet3" = {
        subnet_name      = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
      "subnet4" = {
        subnet_name      = "QA_application_subnet"
        address_prefixes = ["10.0.4.0/24"]
      }
    }
  }
}

QA_public_ip = {
  "public_ip1" = {
    public_ip_name                = "QA_bastion_ip"
    public_ip_location            = "australiaeast"
    public_ip_resource_group_name = "QA_rg"
    public_ip_allocation_method   = "Static"
  }
  "public_ip2" = {
    public_ip_name                = "QA_Application_ip2"
    public_ip_location            = "australiaeast"
    public_ip_resource_group_name = "QA_rg"
    public_ip_allocation_method   = "Static"
  }
}
QA_bastion_host = {
  "bastion1" = {
    bastion_host_name                  = "QA_bastion_host"
    bastion_host_location              = "australiaeast"
    bastion_host_resource_group_name   = "QA_rg"
    bastion_host_ip_configuration_name = "QA_bastion_ip_config"
    QA_bastion_subnet_name             = "AzureBastionSubnet"
    QA_bastion_vnet_name               = "QA_vnet"
    QA_public_ip_name                  = "QA_bastion_ip"
  }
}
QA_nic = {
  "vm1" = {
    QA_nic_name                            = "QA_nic1"
    QA_nic_location                        = "australiaeast"
    QA_nic_resource_group_name             = "QA_rg"
    QA_nic_ip_configuration_name           = "QA_nic_ip_config1"
    QA_nic_subnet_name                     = "QA_frontend_subnet"
    QA_nic_private_ip_address_allocation   = "Dynamic"
    QA_nic_vnet_name                       = "QA_vnet"
    QA_vm_name                             = "QAvmfrontend"
    QA_vm_size                             = "Standard_D2s_v3"
    QA_vm_os_disk_caching                  = "ReadWrite"
    QA_vm_os_disk_storage_account_type     = "Premium_LRS"
    QA_vm_source_image_reference_publisher = "Canonical"
    QA_vm_source_image_reference_offer     = "0001-com-ubuntu-server-jammy"
    QA_vm_source_image_reference_sku       = "22_04-lts-gen2"
    QA_vm_source_image_reference_version   = "latest"
    QA_vm_admin_username                   = "adminuser"
    QA_vm_admin_password                   = "AdminPassword123!"
  }
  vm2 = {
    QA_nic_name                            = "QA_nic2"
    QA_nic_location                        = "australiaeast"
    QA_nic_resource_group_name             = "QA_rg"
    QA_nic_ip_configuration_name           = "QA_nic_ip_config2"
    QA_nic_subnet_name                     = "QA_backend_subnet"
    QA_nic_private_ip_address_allocation   = "Dynamic"
    QA_nic_vnet_name                       = "QA_vnet"
    QA_vm_name                             = "QAvmbackend"
    QA_vm_size                             = "Standard_D2s_v3"
    QA_vm_os_disk_caching                  = "ReadWrite"
    QA_vm_os_disk_storage_account_type     = "Premium_LRS"
    QA_vm_source_image_reference_publisher = "Canonical"
    QA_vm_source_image_reference_offer     = "0001-com-ubuntu-server-jammy"
    QA_vm_source_image_reference_sku       = "22_04-lts-gen2"
    QA_vm_source_image_reference_version   = "latest"
    QA_vm_admin_username                   = "adminuser"
    QA_vm_admin_password                   = "te"
  }
}
QA_nsg = {
  "nsg" = {
    QA_nsg_name                = "QA_nsg"
    QA_nsg_location            = "australiaeast"
    QA_nsg_resource_group_name = "QA_rg"
    security_rule = {
      "rule1" = {
        QA_nsg_security_rule_name                       = "AllowSSH"
        QA_nsg_security_rule_priority                   = 100
        QA_nsg_security_rule_direction                  = "Inbound"
        QA_nsg_security_rule_access                     = "Allow"
        QA_nsg_security_rule_protocol                   = "Tcp"
        QA_nsg_security_rule_source_port_range          = "*"
        QA_nsg_security_rule_destination_port_range     = "22"
        QA_nsg_security_rule_source_address_prefix      = "*"
        QA_nsg_security_rule_destination_address_prefix = "*"
      }
      "rule2" = {
        QA_nsg_security_rule_name                       = "AllowHTTP"
        QA_nsg_security_rule_priority                   = 200
        QA_nsg_security_rule_direction                  = "Inbound"
        QA_nsg_security_rule_access                     = "Allow"
        QA_nsg_security_rule_protocol                   = "Tcp"
        QA_nsg_security_rule_source_port_range          = "*"
        QA_nsg_security_rule_destination_port_range     = "80"
        QA_nsg_security_rule_source_address_prefix      = "*"
        QA_nsg_security_rule_destination_address_prefix = "*"
      }
    }
  }
}
QA_compute_association = {
  "association1" = {
    QA_association_subnet_name         = "QA_frontend_subnet"
    QA_association_vnet_name           = "QA_vnet"
    QA_association_resource_group_name = "QA_rg"
    QA_nsg_name                        = "QA_nsg"
  }
  "association2" = {
    QA_association_subnet_name         = "QA_backend_subnet"
    QA_association_vnet_name           = "QA_vnet"
    QA_association_resource_group_name = "QA_rg"
    QA_nsg_name                        = "QA_nsg"
  }
}
QA_mssql_server = {
  "sqlserver1" = {
    mssql-server-name                         = "qa-sql-server-2026"
    mssql-server-resource-group-name          = "QA_rg"
    mssql-server-location                     = "australiaeast"
    mssql-server-version                      = "12.0"
    mssql-server-administrator-login          = "sqladmin"
    mssql-server-administrator-login-password = "AdminPassword123!"
  }
}
QA_mssql_database = {
  "db1" = {
    mssql_database_name              = "QA_sql_database"
    mssql_server_name                = "qa-sql-server-2026"
    mssql_server_resource_group_name = "QA_rg"
    mssql_database_collation         = "SQL_Latin1_General_CP1_CI_AS"
    mssql_database_license_type      = "BasePrice"
    mssql_database_max_size_gb       = 2
    mssql_database_sku_name          = "S0"
    mssql_database_enclave_type      = "VBS"
  }
}
QA_lb = {
  "lb1" = {
    QA_lb_name                           = "QA_lb"
    QA_lb_location                       = "australiaeast"
    QA_lb_resource_group_name            = "QA_rg"
    QA_lb_sku                            = "Standard"
    QA_lb_frontend_ip_configuration_name = "QA_frontend_ip_config"
    QA_lb_private_ip_address_allocation  = "Dynamic"
    QA_lb_subnet_name                    = "QA_frontend_subnet"
    QA_lb_vnet_name                      = "QA_vnet"
    QA_lb_backend_address_pool_name      = "QA_backend_address_pool"
    QA_lb_probe_name                     = "QA_probe"
    QA_lb_probe_protocol                 = "Tcp"
    QA_lb_probe_port                     = 80
    QA_lb_rule_name                      = "QA_rule"
    QA_lb_rule_protocol                  = "Tcp"
    QA_lb_rule_frontend_port             = 80
    QA_lb_rule_backend_port              = 80
  }
}
QA_bp_nic_association = {
  "bpassociationvm1" = {
    nic_ip_configuration_name       = "QA_nic_ip_config2"
    QA_nic_name                     = "QA_nic2"
    QA_nic_resource_group_name      = "QA_rg"
    QA_lb_name                      = "QA_lb"
    QA_lb_backend_address_pool_name = "QA_backend_address_pool"
  }
}
QA_app_gateway = {
  "app1" = {
    QA_app_gateway_name                                        = "QA_app_gateway"
    QA_app_gateway_location                                    = "australiaeast"
    QA_app_gateway_resource_group_name                         = "QA_rg"
    QA_app_gateway_sku_name                                    = "Standard_v2"
    QA_app_gateway_sku_tier                                    = "Standard_v2"
    QA_app_gateway_sku_capacity                                = 2
    QA_app_gateway_subnet_name                                 = "QA_application_subnet"
    QA_app_gateway_vnet_name                                   = "QA_vnet"
    QA_app_gateway_public_ip_name                              = "QA_Application_ip2"
    QA_app_gateway_ip_configuration_name                       = "QA_app_gateway_ip_config"
    QA_app_gateway_frontend_port_name                          = "QA_frontend_port"
    QA_app_gateway_frontend_port                               = 80
    QA_app_gateway_backend_address_pool_name                   = "QA_backend_address_pool"
    QA_app_gateway_backend_http_settings_name                  = "QA_backend_http_settings"
    QA_app_gateway_backend_http_settings_port                  = 80
    QA_app_gateway_backend_http_settings_protocol              = "Http"
    QA_app_gateway_backend_http_settings_cookie_based_affinity = "Disabled"
    QA_app_gateway_http_listener_name                          = "QA_http_listener"
    QA_app_gateway_frontend_ip_configuration_name              = "QA_Application_frontend_ip_config"
    QA_app_gateway_http_listener_protocol                      = "Http"
    QA_app_gateway_request_routing_rule_name                   = "QA_request_routing_rule"
    QA_app_gateway_request_routing_rule_type                   = "Basic"
    QA_app_gateway_request_routing_rule_priority               = 100


  }
}
QA_app_gateway_vm_association = {
  "assc1" = {
    QA_frontend_vm_nic_name                = "QA_nic1"
    QA_frontend_vm_nic_resource_group_name = "QA_rg"
    QA_app_gateway_name                    = "QA_app_gateway"
    QA_nic_ip_configuration_name           = "QA_nic_ip_config1"



  }
}