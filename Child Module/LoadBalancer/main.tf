data "azurerm_subnet" "subnet" {
  for_each             = var.lbs
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.lb_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "private-frontend-ip"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = "backend-pool"
}

resource "azurerm_lb_probe" "lb_probe" {
  for_each            = var.lbs
  loadbalancer_id     = azurerm_lb.lb[each.key].id
  name                = "http-running-probe"
  port                = 80
  protocol            = "Tcp"
  interval_in_seconds = 15
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each                       = var.lbs
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = "http-lb-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "private-frontend-ip"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool[each.key].id]
  probe_id                       = azurerm_lb_probe.lb_probe[each.key].id
  idle_timeout_in_minutes        = 4
  floating_ip_enabled            = false
}
