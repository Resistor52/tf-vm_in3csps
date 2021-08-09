output "ip" {
  value = azurerm_linux_virtual_machine.vm_instance.public_ip_address
}

output "ssh_connection_string" {
  value = "ssh -i ${var.ssh_priv_key_file} ${var.ssh_user}@${azurerm_linux_virtual_machine.vm_instance.public_ip_address}"
}
