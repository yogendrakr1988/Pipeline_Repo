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

  rg6 = {
    name     = "mango-rg-0505"
    location = "Central India"
  }

}

stgs = {
  stgs1 = {
  name                     = "mangostg0101"
  rg_key      = "rg1"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
  stgs2 = {
  name                     = "mangostg0202"
  rg_key      = "rg2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
  stgs3 = {
  name                     = "mangostg0303"
  rg_key      = "rg3"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
  stgs3 = {
  name                     = "mangostg0404"
  rg_key      = "rg4"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
}
