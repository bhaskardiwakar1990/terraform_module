resource "azurerm_network_interface" "nic" {
  for_each            = var.vmvar
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    name                          = each.value.ipname
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vmvar
  name                            = each.value.vmname
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.password[each.key].value
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids           = [resource.azurerm_network_interface.nic[each.key].id]
  os_disk {
    storage_account_type = each.value.storage_account_type
    caching              = each.value.caching
  }
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
    custom_data = base64encode(<<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y python3 python3-pip
  EOF
  )

}
