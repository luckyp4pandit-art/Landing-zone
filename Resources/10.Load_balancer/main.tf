resource "azurerm_lb" "QA_lb" {
    for_each = var.QA_lb
  name                = each.value.QA_lb_name
  location            = each.value.QA_lb_location
  resource_group_name = each.value.QA_lb_resource_group_name
  sku                 = each.value.QA_lb_sku

  frontend_ip_configuration {
    name                 = each.value.QA_lb_frontend_ip_configuration_name
    private_ip_address_allocation = each.value.QA_lb_private_ip_address_allocation
    subnet_id            = data.azurerm_subnet.QA_lb_subnet[each.key].id
  }
  
}
    resource "azurerm_lb_backend_address_pool" "QA_lb_backend_address_pool" {
       
    for_each = var.QA_lb
    name                = each.value.QA_lb_backend_address_pool_name
    loadbalancer_id     = azurerm_lb.QA_lb[each.key].id
}
resource "azurerm_lb_probe" "QA_lb_probe" {
    
    for_each = var.QA_lb
  name                = each.value.QA_lb_probe_name
  loadbalancer_id     = azurerm_lb.QA_lb[each.key].id
  protocol            = each.value.QA_lb_probe_protocol
  port                = each.value.QA_lb_probe_port
  
}

resource "azurerm_lb_rule" "QA_lb_rule" {
    
    for_each = var.QA_lb
  name                           = each.value.QA_lb_name
  loadbalancer_id                = azurerm_lb.QA_lb[each.key].id
  protocol                       = each.value.QA_lb_probe_protocol
  frontend_port                  = each.value.QA_lb_probe_port
  backend_port                   = each.value.QA_lb_probe_port
  frontend_ip_configuration_name = each.value.QA_lb_frontend_ip_configuration_name
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.QA_lb_backend_address_pool[each.key].id]
  probe_id                       = azurerm_lb_probe.QA_lb_probe[each.key].id
  
}

