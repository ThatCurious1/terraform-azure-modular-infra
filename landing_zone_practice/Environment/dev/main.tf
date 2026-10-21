module "azurerm_resource_group" {
  source = "../../Module/Azurerm_Resource_Group"
  rgs    = var.rgs

}
module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Module/Azurerm_Virtual _Network"
  vnet       = var.vnet

}
module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../Module/Azurerm_Subnet"
  subnet     = var.subnet

}

module "azurerm_bastion_host" {
  depends_on = [module.azurerm_subnet]
  source     = "../../Module/Azurerm_Bastion"
  bastion    = var.bastion

}

module "azurerm_network_interface" {
  depends_on = [module.azurerm_subnet]
  source     = "../../Module/Azurerm_Network_interface"
  nic        = var.nic

}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../Module/Azurerm_Pip"
  pip        = var.pip

}

module "azurerm_linux_virtual_machine" {
  depends_on = [module.azurerm_network_interface]
  source     = "../../Module/Azurerm_Virtual_Machine"
  vm         = var.vm

}