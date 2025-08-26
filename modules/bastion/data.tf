data "azurerm_subnet" "subnet" {
  for_each             = var.bation
  name                 = each.value.bastionname
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}