rgs = {
  rg1 = {
    name     = "dev-rg1"
    location = "East US"
  }
  rg2 = {
    name     = "dev-rg2"
    location = "East US"
  }
}

vnet = {
  vnet1 = {
    name     = "dev-vnet1"
    location = "east us"
    rg       = "dev-rg1"
    address  = ["10.0.0.0/16"]
  }
  vnet2 = {
    name     = "dev-vnet2"
    location = "east us"
    rg       = "dev-rg2"
    address  = ["11.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name     = "dev-subnet"
    rg       = "dev-rg1"
    vnet     = "dev-vnet1"
    prefixes = ["10.0.1.0/24"]

  }
  subnet2 = {
    name     = "AzureBastionSubnet"
    rg       = "dev-rg1"
    vnet     = "dev-vnet1"
    prefixes = ["10.0.2.0/27"]

  }

}

nic = {
  nic1 = {
    name     = "dev-nic"
    location = "east us"
    rg       = "dev-rg1"
    subname  = "dev-subnet"
    vnet     = "dev-vnet1"

  }
}

pip = {
  pip1 = {
    name     = "dev-pip"
    rg       = "dev-rg1"
    location = "east us"

  }
}

bastion = {
  bastion1 = {
    name     = "Dev_bastion"
    location = "east us"
    rg       = "dev-rg1"
    subname  = "AzureBastionSubnet"
    vnet     = "dev-vnet1"
    pipname  = "dev-pip"

  }
}

vm = {
  vm1 = {
    name     = "dev-vm1"
    rg       = "dev-rg1"
    location = " east us"
    nicname  = "dev-nic"
  }
}