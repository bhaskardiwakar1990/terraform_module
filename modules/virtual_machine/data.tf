data "azurerm_subnet" "subnet" {
  for_each             = var.vmvar
  name                 = each.value.subname
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name

}

data "azurerm_key_vault" "kv" {
for_each = var.vmvar
  name                = each.value.kvname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
    for_each = var.vmvar
  name         = "${each.key}-username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
    for_each = var.vmvar
  name         = "${each.key}-password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
