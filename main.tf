resource "azurerm_resource_group" "rg" {
    for_each = var.rgs
    name = each.value.name
    location = each.value.location
  }

resource "azurerm_storage_account" "stgs" {
  for_each = var.stgs
  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.rg[each.value.rg_key].name
  location                 = azurerm_resource_group.rg[each.value.rg_key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet
  name                = each.value.name
  address_space       = each.value.address_space
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
}


