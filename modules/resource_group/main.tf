resource "azurerm_resource_group" "eight-th-rg" {
  for_each = var.rgvar
  name     = each.value.name
  location = each.value.location
}