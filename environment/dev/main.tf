module "resource_group" {
  source = "../../modules/resource_group"
  rgvar  = var.rgnewvar
}
module "storage_account" {
  source = "../../modules/storage_account"
  stgvar = var.stgnewvar
}
module "vent" {
  depends_on = [module.resource_group]
  source     = "../../modules/vnet"
  vnetvar    = var.vnetvardev
}
module "virtual_machine" {
  depends_on = [module.resource_group, module.keyvault,module.vent]
  source     = "../../modules/virtual_machine"
  vmvar      = var.vmvardev
}
module "keyvault" {
  depends_on = [ module.resource_group,module.vent ]
  source = "../../modules/key_vault"
  vmvar  = var.vmvardev
}
module "bation" {
  depends_on = [ module.vent,module.resource_group,module.virtual_machine ]
  source = "../../modules/bastion"
  bation=var.bationdev
 }
module "lb" {
  depends_on = [ module.resource_group,module.vent,module.virtual_machine,module.keyvault,module.bation ]
  source = "../../modules/loadbalancer"
  vmvar = var.vmvardev
 }
module "mssql_server" {
  depends_on = [ module.virtual_machine,module.keyvault,module.vent,module.resource_group ]
  source = "../../modules/database"
  
}