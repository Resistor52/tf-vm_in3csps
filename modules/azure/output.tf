output "ip" {
  description = "The public IP address of the virtual machine"
  value = data.azurerm_public_ip.vm.ip_address
}

output "ssh_connection_string" {
  description = "The SSH command to connect to the virtual machine"
  value = "ssh -i ${var.ssh_priv_key_file} ${var.ssh_user}@${data.azurerm_public_ip.vm.ip_address}"
}
