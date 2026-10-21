resource "azurerm_public_ip" "pips" {
    for_each = var.pip
  name                = each.value.name
  resource_group_name = each.value.rg
  location            = each.value.location  
  allocation_method   = "Static"
  }