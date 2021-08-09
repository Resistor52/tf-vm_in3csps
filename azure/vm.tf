resource "azurerm_linux_virtual_machine" "vm_instance" {
  name                            = "hitc"
  location                        = azurerm_resource_group.hitc.location
  resource_group_name             = azurerm_resource_group.hitc.name
  network_interface_ids           = [azurerm_network_interface.hitc-nic.id]
  size                            = "Standard_B1s"
  computer_name                   = "hitc-azure"
  admin_username                  = "ubuntu"
  disable_password_authentication = true

  # custom_data                   = base64encode(file("workstation1.sh"))

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name                 = "hitc"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.ssh_pub_key_file)
  }

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_public_ip" "vm" {
  depends_on          = [azurerm_linux_virtual_machine.vm_instance, azurerm_public_ip.hitc]
  name                = azurerm_public_ip.hitc.name
  resource_group_name = azurerm_resource_group.hitc.name
}
