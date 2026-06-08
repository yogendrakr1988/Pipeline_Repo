rgs = {

  rg1 = {
    name     = "dev-rg"
    location = "Central India"
  }

  rg2 = {
    name     = "prod-rg"
    location = "Central India"
  }

}

stg = {

  stg1 = {
    name                = "devopsstg001"
    resource_group_name = "dev-rg"
    location            = "Central India"
  }

  stg2 = {
    name                = "devopsstg002"
    resource_group_name = "prod-rg"
    location            = "Central India"
  }

}