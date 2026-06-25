rgs = {

  rg1 = {
    name     = "mango-rg-0101"
    location = "Central India"
  }

  rg2 = {
    name     = "mango-rg-0202"
    location = "Central India"
  }

  rg3 = {
    name     = "mango-rg-0303"
    location = "Central India"
  }

  rg5 = {
    name     = "mango-rg-0404"
    location = "Central India"
  }

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

nsgs = {
  nsgs1 = {
     name                = "testnsg80"
  rg_key = "rg1"

 security_rule = {
    name                       = "SSHHTTPRDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["22", "80", "3389"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  }
  nsgs2 = {
     name                = "testnsg81"
  rg_key = "rg2"

   security_rule = {
    name                       = "SSHHTTPRDP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["22", "80", "3389"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  }
}

pips = {
   pips01 = {
  name                = "yogi67pip"
  rg_key = "rg1"
  allocation_method   = "Static"
  }

  pips03 = {
  name                = "yogi68pip"
  rg_key = "rg2"
  allocation_method   = "Static"
  }
   pips02 = {
  name                = "yogi69pip"
 rg_key = "rg3"
  allocation_method   = "Static"
  }
}


nics = {

  nic1 = {
    name                = "test-nic-04"
    rg_key = "rg1"

    ip_configuration = {
      name                          = "yogi01"
      subnet_key                     = "subnets01"
      private_ip_address_allocation = "Dynamic"
      pip_key          = "pips01"
    }
  }

  nic2 = {
    name                = "test-nic-05"
    rg_key = "rg2"

    ip_configuration = {
      name                          = "yogi02"
      subnet_key                     = "subnets02"
      private_ip_address_allocation = "Dynamic"
      pip_key          = "pips02"
    }
  }

  # nic31 = {
  #   name                = "test-nic-06"
  #   rg_key = "rg3"

  #   ip_configuration = {
  #     name                          = "yogi03"
  #     subnet_id                     = "/subscriptions/bdb89ac3-e42b-4f59-993e-7dde7e60d4e0/resourceGroups/dev-rg-101/providers/Microsoft.Network/virtualNetworks/testvnet01/subnets/testsubnet011"
  #     private_ip_address_allocation = "Dynamic"
  #     public_ip_address_id          = "/subscriptions/bdb89ac3-e42b-4f59-993e-7dde7e60d4e0/resourceGroups/dev-rg-101/providers/Microsoft.Network/publicIPAddresses/yogi69pip"
  #   }
  # }

}
