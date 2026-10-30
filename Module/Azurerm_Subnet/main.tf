resource "azurerm_subnet" "subnets" {
    for_each = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.rg
  virtual_network_name = each.value.vnet
  address_prefixes     = each.value.prefixes
}