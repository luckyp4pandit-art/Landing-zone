variable "QA_nsg" {
  type = map(object({
    QA_nsg_name  = string
    QA_nsg_location = string
    QA_nsg_resource_group_name = string
    security_rule = map(object({
      QA_nsg_security_rule_name = string
      QA_nsg_security_rule_priority = number
      QA_nsg_security_rule_direction = string
      QA_nsg_security_rule_access = string
      QA_nsg_security_rule_protocol = string
      QA_nsg_security_rule_source_port_range = string
      QA_nsg_security_rule_destination_port_range = string
      QA_nsg_security_rule_source_address_prefix = string
      QA_nsg_security_rule_destination_address_prefix = string
    }))
  
  }))
}