rgs = {
  rg1 = {
    rg_name  = "yogendra_bhai0989_rg"
    rg_location = "central india"
  }
}

stgs = {
  stg1 = {
  stg_name                 = "yogi0406"
  rg_name                  = "yogendra_bhai0989_rg"
  rg_location              = "central india"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
}

vnets = {
  vnet1 = {
    vnet_name     = "frontend-vnet"
    address_space = ["10.0.0.0/16"]
    rg_location = "central india"
    rg_name       = "yogendra_bhai0989_rg"
  }

  vnet2 = {
    vnet_name     = "backend-vnet"
    address_space = ["10.1.0.0/16"]
    rg_location = "central india"
    rg_name       = "yogendra_bhai0989_rg"
  }

  vnet3 = {
    vnet_name     = "jumpvm-vnet"
    address_space = ["10.2.0.0/16"]
    rg_location = "central india"
    rg_name       = "yogendra_bhai0989_rg"
  }

}

nsgs = {

  nsg1 = {
    nsg_name = "frontend_nsg"
    rg_location = "central india"
    rg_name = "yogendra_bhai0989_rg"
    subnet_name = "frontend-subnet"
    vnet_name = "frontend-vnet"
  }
 nsg2 = {
    nsg_name = "backend_nsg"
    rg_location = "central india"
    rg_name = "yogendra_bhai0989_rg"
    subnet_name = "backend-subnet"
    vnet_name = "backend-vnet"
  }
 nsg3 = {
    nsg_name = "jumpvm_nsg"
    rg_location = "central india"
    rg_name = "yogendra_bhai0989_rg"
    subnet_name = "jumpvm-subnet"
    vnet_name = "jumpvm-vnet"
  }

}

subnets = {
  subnet1 = {
    subnet_name      = "frontend-subnet"
    rg_name          = "yogendra_bhai0989_rg"
    vnet_name        = "frontend-vnet"
    address_prefixes = ["10.0.0.0/24"]
  }
    subnet2 = {
    subnet_name      = "backend-subnet"
    rg_name          = "yogendra_bhai0989_rg"
    vnet_name        = "backend-vnet"
    address_prefixes = ["10.1.1.0/24"]
  }
 subnet3 = {
    subnet_name      = "jumpvm-subnet"
    rg_name          = "yogendra_bhai0989_rg"
    vnet_name        = "jumpvm-vnet"
    address_prefixes = ["10.2.1.0/24"]
  }
    subnet4 = {
    subnet_name      = "jaan02-subnet"
    rg_name          = "yogendra_bhai0989_rg"
    vnet_name        = "frontend-vnet"
    address_prefixes = ["10.0.3.0/24"]
  }
  subnet5 = {
    subnet_name      = "jaan03-subnet"
    rg_name          = "yogendra_bhai0989_rg"
    vnet_name        = "frontend-vnet"
    address_prefixes = ["10.0.4.0/24"]
  }
  subnet6 = {
    subnet_name      = "appgw-subnet"
    rg_name          = "yogendra_bhai0989_rg"
    vnet_name        = "frontend-vnet"
    address_prefixes = ["10.0.5.0/24"]
  }
}

pips = {
  # pip1 =  {
  #   pip_name = "frontend-pip"
  #   rg_name = "yogendra_bhai0989_rg"
  #   rg_location = "central india"
  #   allocation_method = "Static"
  # }
  pip2 =  {
    pip_name = "backend-pip"
    rg_name = "yogendra_bhai0989_rg"
    rg_location = "central india"
    allocation_method = "Static"
  }
  pip3 =  {
    pip_name = "jumpvm-pip"
    rg_name = "yogendra_bhai0989_rg"
    rg_location = "central india"
    allocation_method = "Static"
  }
  pip4 =  {
    pip_name = "appgw-pip"
    rg_name = "yogendra_bhai0989_rg"
    rg_location = "central india"
    allocation_method = "Static"
  }
}

nics = {
  # vm1 = {
  #   nic_name = "frontend-nic"
  #   rg_location = "central india"
  #   rg_name = "yogendra_bhai0989_rg"
  #   ip_name = "sandeep-ip"
  #   pip_name = "frontend-pip"
  #   subnet_name = "frontend-subnet"
  #   vnet_name = "frontend-vnet"
  #   ip_allocation = "Dynamic"
  # }
  vm2 = {
    nic_name = "backend-nic"
    rg_location = "central india"
    rg_name = "yogendra_bhai0989_rg"
    ip_name = "yogi-ip"
    pip_name = "backend-pip"
    subnet_name = "backend-subnet"
    vnet_name = "backend-vnet"
    ip_allocation = "Dynamic"
  }
  # vm3 = {
  #   nic_name = "jumpvm-nic"
  #   rg_location = "central india"
  #   rg_name = "yogendra_bhai0989_rg"
  #   ip_name = "yogi-ip"
  #   subnet_name = "jumpvm-subnet"
  #   vnet_name = "jumpvm-vnet"
  #   pip_name = "jumpvm-pip"
  #   ip_allocation = "Dynamic"
  # }

}

vms = {

  # vm1 = {
  #   vm_name = "frontend-vm01"
  #   rg_name = "yogendra_bhai0989_rg"
  #   rg_location = "central india"
  #   vm_size = "Standard_D2_v3"
  #   admin_username = "frontendvm0001"
  #   admin_password = "Yogi@2026"
  #   github_token      = "ghp_123456789012345678901234567890123456"
  #   caching = "ReadWrite"
  #   stg_type = "Standard_LRS"
  #   publisher = "Canonical"
  #   offer = "UbuntuServer"
  #   sku = "16.04-LTS"
  #   version = "latest"
  #   nic_name = "frontend-nic"

  # }
vm2 = {
    vm_name = "backend-vm01"
    rg_name = "yogendra_bhai0989_rg"
    rg_location = "central india"
    vm_size = "Standard_D2_v3"
    admin_username = "backendvm0001"
    admin_password = "Yogi@2026"
    caching = "ReadWrite"
    stg_type = "Standard_LRS"
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"
    nic_name = "backend-nic"

  }

vm3 = {
    vm_name = "jump-server"
    rg_name = "yogendra_bhai0989_rg"
    rg_location = "central india"
    vm_size = "Standard_D2_v3"
    admin_username = "jumpvm"
    admin_password = "Yogi@2026"
    caching = "ReadWrite"
    stg_type = "Standard_LRS"
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"
    nic_name = "jumpvm-nic"

  }

}

appgws = {
  appgw1 = {
    appgw_name  = "frontend-appgw"
    rg_name     = "yogendra_bhai0989_rg"
    rg_location = "central india"
    subnet_name = "appgw-subnet"
    vnet_name   = "frontend-vnet"
    pip_name    = "appgw-pip"
  }
}

lbs = {
  lb1 = {
    lb_name     = "backend-lb"
    rg_name     = "yogendra_bhai0989_rg"
    rg_location = "central india"
    subnet_name = "backend-subnet"
    vnet_name   = "backend-vnet"
  }
}