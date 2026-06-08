resource "azurerm_resource_group" "rg" {
    for_each = var.rgs
    name = each.value.name
    location = each.value.location
  }
variable "rgs" {}

resource "azurerm_storage_account" "stg" {
    depends_on = [ azurerm_resource_group.rg ]
    for_each = var.stg
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

variable "stg" {}