data "azurerm_subnet" "sbnt" {
  for_each = var.bastion
  name                 = each.value.subname
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.rg
}
data "azurerm_public_ip" "pips" {
  for_each = var.bastion
  name                = each.value.pipname
  resource_group_name = each.value.rg
}

resource "azurerm_bastion_host" "bastions" {
    for_each = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.sbnt[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pips[each.key].id
  }
}