resource "azurerm_public_ip" "bastion_pip" {
    for_each = var.bation
  name                = each.value.ipname
  location            = each.value.location
  resource_group_name =each.value.resource_group_name
  allocation_method   = each.value.ipallocation_method
  sku                 = each.value.ipsku
}

resource "azurerm_bastion_host" "bastion" {
    for_each = var.bation
  name                = each.value.bastionname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ipcongbastionname
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.bastion_pip[each.key].id
  }
}

