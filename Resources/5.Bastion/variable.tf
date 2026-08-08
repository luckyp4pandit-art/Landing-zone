variable "QA_bastion_host" {
  type = map(object({
    bastion_host_name = string
    bastion_host_location = string 
    bastion_host_resource_group_name = string
    bastion_host_ip_configuration_name = string
    QA_bastion_subnet_name = string
    QA_bastion_vnet_name = string
    QA_public_ip_name = string
  })
  )
}
