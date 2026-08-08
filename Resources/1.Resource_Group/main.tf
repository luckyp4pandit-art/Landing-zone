resource "azurerm_resource_group" "QA_rg" {
  for_each = var.QA_rg
    name     = each.value.rg_name
    location = each.value.rg_location
}
