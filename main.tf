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

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.rg[each.value.rg_key].name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsgs
  name                = each.value.name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name

  security_rule {
    name                       = each.value.security_rule.name
    priority                   = each.value.security_rule.priority
    direction                  = each.value.security_rule.direction
    access                     = each.value.security_rule.access
    protocol                   = each.value.security_rule.protocol
    source_port_range          = each.value.security_rule.source_port_range
    destination_port_ranges     = each.value.security_rule.destination_port_ranges
    source_address_prefix      = each.value.security_rule.source_address_prefix
    destination_address_prefix = each.value.security_rule.destination_address_prefix
    
  }
}

resource "azurerm_public_ip" "pip" {
  for_each = var.pips
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  allocation_method   = each.value.allocation_method
}

resource "azurerm_network_interface" "nic8" {
  for_each = var.nics
  name                = each.value.name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = azurerm_subnet.subnet[each.value.ip_configuration.subnet_key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
public_ip_address_id = azurerm_public_ip.pip[each.value.ip_configuration.pip_key].id  
}
}
