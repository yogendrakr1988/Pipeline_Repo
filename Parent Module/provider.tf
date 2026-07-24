terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "yogi0101-rg"
#     storage_account_name = "yogi0101storage"
#     container_name       = "yogi0101container"
#     key                  = "yogi.tfstate"
#   }
#}
provider "azurerm" {
  features {}
}