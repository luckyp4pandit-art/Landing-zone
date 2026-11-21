variable "QA_app_gateway_vm_association" {
  type = map(object({
    QA_frontend_vm_nic_name                     = string
    QA_frontend_vm_nic_resource_group_name      = string
    QA_app_gateway_name                         = string
    QA_nic_ip_configuration_name                  = string
    
  }))
}