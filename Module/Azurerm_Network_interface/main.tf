data "azurerm_subnet" "subnt" {
  for_each = var.nic
  name                 = each.value.subname
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.rg
}

resource "azurerm_network_interface" "nics" {
    for_each = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnt[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
