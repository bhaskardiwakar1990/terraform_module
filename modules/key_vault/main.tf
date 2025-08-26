data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each                   = var.vmvar
  name                       = each.value.kvname
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  soft_delete_retention_days = each.value.soft_delete_retention_days
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled   = each.value.purge_protection_enabled
  sku_name                   = each.value.sku_name
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "Get", "List"
    ]

    secret_permissions = [
      "Get", "Set", "List", "Delete", "Recover", "Backup", "Purge"
    ]
  }
}
resource "azurerm_key_vault_secret" "username" {
  for_each     = var.vmvar
  name         = "${each.key}-username"
  value        = "chandanuser"
  key_vault_id = azurerm_key_vault.kv[each.key].id
}

resource "random_password" "password" {
  for_each         = var.vmvar
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "password" {
  for_each     = random_password.password
  name         = "${each.key}-password"
  value        = random_password.password[each.key].result
  key_vault_id = azurerm_key_vault.kv[each.key].id
}
