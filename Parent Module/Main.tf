module "rgs" {
  source = "../Child Module/RG"
  rgs    = var.rgs
}

module "stgs" {
  depends_on = [ module.rgs ]
  source = "../Child Module/storage_account"
  stgs   = var.stgs
}

module "vnets" {
depends_on = [ module.rgs ]
  source = "../Child Module/VNET"
  vnets  = var.vnets
}

module "subnets" {
  depends_on = [ module.vnets ]
  source  = "../Child Module/Subnet"
  subnets = var.subnets
}

module "nics" {
  depends_on = [ module.subnets, module.pips ]
  source = "../Child Module/NIC"
  nics = var.nics
}

module "pips" {
  depends_on = [ module.rgs ]
  source = "../Child Module/PIP"
  pips = var.pips
 }

 module "association" {
  depends_on = [ module.nsgs ]
  source = "../Child Module/association_NSG_Subnet"
  nsgs = var.nsgs
   
 }

module "nsgs" {
  depends_on = [ module.subnets ]
  source = "../Child Module/NSG"
  nsgs = var.nsgs
}

module "vms" {
  depends_on = [ module.nics ]
source = "../Child Module/Linux-vm"
vms = var.vms
}