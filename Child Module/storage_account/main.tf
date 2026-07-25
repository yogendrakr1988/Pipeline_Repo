resource "azurerm_storage_account" "stg" {
    for_each = var.stgs
  name                     = each.value.stg_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.rg_location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type


}