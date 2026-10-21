rgs = {
  rg1 = {
    name     = "prod-rg1"
    location = "East US"
  }
  rg2 = {
    name     = "prod-rg2"
    location = "East US"
  }
}

vnet = {
  vnet1 = {
    name     = "prod-vnet1"
    location = "east us"
    rg       = "prod-rg1"
    address  = ["10.0.0.0/16"]
  }
  vnet2 = {
    name     = "prod-vnet2"
    location = "east us"
    rg       = "prod-rg2"
    address  = ["11.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name     = "prod-subnet"
    rg       = "prod-rg1"
    vnet     = "prod-vnet1"
    prefixes = ["10.0.1.0/24"]

  }
  subnet2 = {
    name     = "AzureBastionSubnet"
    rg       = "prod-rg1"
    vnet     = "prod-vnet1"
    prefixes = ["10.0.2.0/27"]

  }

}

nic = {
  nic1 = {
    name     = "prod-nic"
    location = "east us"
    rg       = "prod-rg1"
    subname  = "prod-subnet"
    vnet     = "prod-vnet1"

  }
}

pip = {
  pip1 = {
    name     = "prod-pip"
    rg       = "prod-rg1"
    location = "east us"

  }
}

bastion = {
  bastion1 = {
    name     = "prod_bastion"
    location = "east us"
    rg       = "prod-rg1"
    subname  = "AzureBastionSubnet"
    vnet     = "prod-vnet1"
    pipname  = "prod-pip"

  }
}

vm = {
  vm1 = {
    name     = "prod-vm1"
    rg       = "prod-rg1"
    location = " east us"
    nicname  = "prod-nic"
  }
}