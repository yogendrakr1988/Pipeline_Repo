data "azurerm_subnet" "subnet" {
  for_each             = var.appgws
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.appgws
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_application_gateway" "network" {
  for_each            = var.appgws
  name                = each.value.appgw_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.subnet[each.key].id
  }

  frontend_port {
    name = "frontend-port-name"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip-configuration-name"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }

  backend_address_pool {
    name = "backend-address-pool-name"
  }

  backend_http_settings {
    name                  = "backend-http-settings-name"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "listener-name"
    frontend_ip_configuration_name = "frontend-ip-configuration-name"
    frontend_port_name             = "frontend-port-name"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routing-rule-name"
    rule_type                  = "Basic"
    http_listener_name         = "listener-name"
    backend_address_pool_name  = "backend-address-pool-name"
    backend_http_settings_name = "backend-http-settings-name"
    priority                   = 1
  }
}
