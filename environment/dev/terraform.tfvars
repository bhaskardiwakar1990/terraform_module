rgnewvar = {
  rg1 = {
    name     = "new-software"
    location = "eastus"
  }
}
stgnewvar = {
  stg1 = {
    name                     = "mysoftwareaccount"
    location                 = "eastus"
    resource_group_name      = "new-software"
    account_replication_type = "LRS"
    account_tier             = "Standard"
  }
}
vnetvardev = {
  vnet1 = {
    name                = "softwarevnet"
    location            = "eastus"
    resource_group_name = "new-software"
    address_space       = ["10.0.0.0/16"]
    subnet1 = {
      sub1 = {
        name             = "forntendsubnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      sub2 = {
        name             = "backendsubnet"
        address_prefixes = ["10.0.2.0/24"]
      }
      sub3 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
    }
  }
}
vmvardev = {
  vm1 = {
    backendpoolname                 = "chandanbackend"
    nicname                         = "nic2"
    location                        = "eastus"
    resource_group_name             = "new-software"
    ipname                          = "firstip"
    private_ip_address_allocation   = "Dynamic"
    subname                         = "forntendsubnet"
    virtual_network_name            = "softwarevnet"
    vmname                          = "universal-vm1"
    size                            = "Standard_F2"
    disable_password_authentication = false
    storage_account_type            = "Standard_LRS"
    caching                         = "ReadWrite"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    version                         = "latest"
    sku                             = "22_04-lts"
    kvname                          = "keyvaultranapradeep1"
    soft_delete_retention_days      = 7
    purge_protection_enabled        = false
    sku_name                        = "standard"
    ipname                          = "bastion-pip"
    ipallocation_method             = "Static"
    ipsku                           = "Standard"
    bastionname                     = "software-bastion"
    ipcongbastionname               = "ipconfiguration"
  }
  vm2 = {
    backendpoolname                 = "chandanbackend1"
    nicname                         = "nic1"
    location                        = "eastus"
    resource_group_name             = "new-software"
    ipname                          = "firstip"
    private_ip_address_allocation   = "Dynamic"
    subname                         = "backendsubnet"
    virtual_network_name            = "softwarevnet"
    vmname                          = "universal-vm2"
    size                            = "Standard_F2"
    disable_password_authentication = false
    storage_account_type            = "Standard_LRS"
    caching                         = "ReadWrite"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    version                         = "latest"
    sku                             = "22_04-lts"
    kvname                          = "keyvaultranapradeep"
    soft_delete_retention_days      = 7
    purge_protection_enabled        = false
    sku_name                        = "standard"
    ipname                          = "bastion-pip"
    ipallocation_method             = "Static"
    ipsku                           = "Standard"
    bastionname                     = "software-bastion"
    ipcongbastionname               = "ipconfiguration"
  }
}

bationdev = {
  bastion1 = {
    ipname               = "bastion-pip"
    ipallocation_method  = "Static"
    ipsku                = "Standard"
    ipcongbastionname    = "ipconfiguration"
    location             = "eastus"
    resource_group_name  = "new-software"
    bastionname          = "AzureBastionSubnet"
    virtual_network_name = "softwarevnet"
  }
}
