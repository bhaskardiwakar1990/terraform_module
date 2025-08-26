data "azurerm_virtual_network" "vnet" {
  name                = "softwarevnet"
  resource_group_name = "new-software"
}

data "azurerm_network_interface" "nicip" {
  for_each            = var.vmvar
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}
