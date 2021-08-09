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

resource "azurerm_network_interface" "hitc-nic" {
  name                = "hitc-nic"
  location            = azurerm_resource_group.hitc.location
  resource_group_name = azurerm_resource_group.hitc.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.hitc-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
