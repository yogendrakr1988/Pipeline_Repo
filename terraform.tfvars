rgs = {

  rg1 = {
    name     = "mango-rg-0101"
    location = "Central India"
  }

  rg2 = {
    name     = "mango-rg-0202"
    location = "Central India"
  }

  # rg3 = {
  #   name     = "mango-rg-0303"
  #   location = "Central India"
  # }

  # rg5 = {
  #   name     = "mango-rg-0404"
  #   location = "Central India"
  # }

  # rg6 = {
  #   name     = "mango-rg-0505"
  #   location = "Central India"
  # }

}

stgs = {
  stgs1 = {
  name                     = "mangostg0101"
  rg_key      = "rg1"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
#   stgs2 = {
#   name                     = "mangostg0202"
#   rg_key      = "rg2"
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
# }
#   stgs3 = {
#   name                     = "mangostg0303"
#   rg_key      = "rg3"
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
# }
#   stgs4 = {
#   name                     = "mangostg0404"
#   rg_key      = "rg5"
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
# }
}

vnet = {
  vnets01 = {
    name = "testvnet90"
    address_space = ["10.142.0.0/16"]
    rg_key = "rg1"
  }
  vnets02 = {
    name = "testvnet91"
    address_space = ["10.143.0.0/16"]
    rg_key = "rg2"
  }
}

subnets = {
  subnets01 = {
    name             = "testsubnet01"
    rg_key           = "rg1"
    vnet_key         = "vnets01"
    address_prefixes = ["10.142.1.0/24"]
  }

  subnets02 = {
    name             = "testsubnet02"
    rg_key           = "rg2"
    vnet_key         = "vnets02"
    address_prefixes = ["10.143.1.0/24"]
  }

  subnets03 = {
    name             = "AzureBastionSubnet"
    rg_key           = "rg1"
    vnet_key         = "vnets01"
    address_prefixes = ["10.142.2.0/26"]
  }

  subnets04 = {
    name             = "AzureBastionSubnet"
    rg_key           = "rg2"
    vnet_key         = "vnets02"
    address_prefixes = ["10.143.2.0/26"]
  }
}
