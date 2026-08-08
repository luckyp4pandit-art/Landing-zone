variable "QA_bp_nic_association" {
  type = map(object({
    nic_ip_configuration_name = string
    QA_nic_name = string
    QA_nic_resource_group_name = string
    QA_lb_name = string
    QA_lb_backend_address_pool_name = string

  }))
}