resource "azurerm_application_gateway" "QA_app_gateway" {
  for_each = var.QA_app_gateway
    name                = each.value.QA_app_gateway_name
    location            = each.value.QA_app_gateway_location
    resource_group_name = each.value.QA_app_gateway_resource_group_name
    sku {
        name     = each.value.QA_app_gateway_sku_name
        tier     = each.value.QA_app_gateway_sku_tier
        capacity = each.value.QA_app_gateway_sku_capacity
    }
    gateway_ip_configuration {
        name      = each.value.QA_app_gateway_ip_configuration_name
        subnet_id = data.azurerm_subnet.QA_application_subnet[each.key].id
    }
    frontend_port {
        name = each.value.QA_app_gateway_frontend_port_name
        port = each.value.QA_app_gateway_frontend_port
    }
    frontend_ip_configuration {
        name                 = each.value.QA_app_gateway_frontend_ip_configuration_name
        public_ip_address_id = data.azurerm_public_ip.QA_public_ip[each.key].id
    }
    backend_address_pool {
        name = each.value.QA_app_gateway_backend_address_pool_name
     
    }
    backend_http_settings {
        name                  = each.value.QA_app_gateway_backend_http_settings_name
        port                  = each.value.QA_app_gateway_backend_http_settings_port
        protocol              = each.value.QA_app_gateway_backend_http_settings_protocol
        cookie_based_affinity = each.value.QA_app_gateway_backend_http_settings_cookie_based_affinity
    }
    http_listener {
        name                           = each.value.QA_app_gateway_http_listener_name
        frontend_ip_configuration_name = each.value.QA_app_gateway_frontend_ip_configuration_name
        frontend_port_name              = each.value.QA_app_gateway_frontend_port_name
        protocol                        = each.value.QA_app_gateway_http_listener_protocol
    }
    request_routing_rule {
        name                       = each.value.QA_app_gateway_request_routing_rule_name
        rule_type                  = each.value.QA_app_gateway_request_routing_rule_type
        http_listener_name         = each.value.QA_app_gateway_http_listener_name
        backend_address_pool_name = each.value.QA_app_gateway_backend_address_pool_name
        backend_http_settings_name = each.value.QA_app_gateway_backend_http_settings_name
        priority = each.value.QA_app_gateway_request_routing_rule_priority
    }
}

