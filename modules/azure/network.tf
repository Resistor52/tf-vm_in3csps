resource "azurerm_virtual_network" "hitc-vnet" {
  name                = "hitc-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.hitc.location
  resource_group_name = azurerm_resource_group.hitc.name
}

resource "azurerm_subnet" "hitc-subnet" {
  name                 = "hitc-subnet"
  resource_group_name  = azurerm_resource_group.hitc.name
  virtual_network_name = azurerm_virtual_network.hitc-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "hitc" {
   name                = "hitc"
   location            = azurerm_resource_group.hitc.location
   resource_group_name = azurerm_resource_group.hitc.name
   allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "hitc-nsg" {
    name                = "hitc-nsg"
    location            = azurerm_resource_group.hitc.location
    resource_group_name = azurerm_resource_group.hitc.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = ["${chomp(data.http.myip.body)}/32"]
        destination_address_prefix = "*"
    }

    tags = {
        environment = "HitC Demo"
    }
}

resource "azurerm_network_interface" "hitc-nic" {
  name                = "hitc-nic"
  location            = azurerm_resource_group.hitc.location
  resource_group_name = azurerm_resource_group.hitc.name

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.hitc-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.hitc.id
  }
}

resource "azurerm_network_interface_security_group_association" "hitc" {
    network_interface_id      = azurerm_network_interface.hitc-nic.id
    network_security_group_id = azurerm_network_security_group.hitc-nsg.id
}
