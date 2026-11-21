variable "QA_app_gateway" {
  type = map(object({
    QA_app_gateway_name = string
    QA_app_gateway_location = string
    QA_app_gateway_resource_group_name = string
    QA_app_gateway_sku_name = string
    QA_app_gateway_sku_tier = string
    QA_app_gateway_sku_capacity = number
    QA_app_gateway_subnet_name = string
    QA_app_gateway_vnet_name = string
    QA_app_gateway_public_ip_name = string
    QA_app_gateway_ip_configuration_name = string
    QA_app_gateway_frontend_port_name = string
    QA_app_gateway_frontend_port = number
    QA_app_gateway_backend_address_pool_name = string
    QA_app_gateway_backend_http_settings_name = string
    QA_app_gateway_backend_http_settings_port = number
    QA_app_gateway_backend_http_settings_protocol = string
    QA_app_gateway_backend_http_settings_cookie_based_affinity = string
    QA_app_gateway_http_listener_name = string
    QA_app_gateway_frontend_ip_configuration_name = string
    QA_app_gateway_http_listener_protocol = string
    QA_app_gateway_request_routing_rule_name = string
    QA_app_gateway_request_routing_rule_type = string
    QA_app_gateway_request_routing_rule_priority = number
    
  }))
}
