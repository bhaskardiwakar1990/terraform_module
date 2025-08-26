resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnetvar
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dynamic "subnet" {
    for_each = var.vnetvar[each.key].subnet1
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}
