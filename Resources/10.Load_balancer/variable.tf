variable "QA_lb" {
  type = map(object({
    QA_lb_name = string
    QA_lb_location = string
    QA_lb_resource_group_name = string
    QA_lb_sku = string
    QA_lb_frontend_ip_configuration_name = string
    QA_lb_private_ip_address_allocation = string
    QA_lb_subnet_name = string
    QA_lb_vnet_name = string
    QA_lb_backend_address_pool_name = string
    QA_lb_probe_name = string
    QA_lb_probe_protocol = string
    QA_lb_probe_port = number
    QA_lb_rule_name = string
    QA_lb_rule_protocol = string
    QA_lb_rule_frontend_port = number
    QA_lb_rule_backend_port = number
    

  }))
}