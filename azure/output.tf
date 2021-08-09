output "ip" {
  value = data.azurerm_public_ip.vm.ip_address
}

output "ssh_connection_string" {
  value = "ssh -i ${var.ssh_priv_key_file} ${var.ssh_user}@${data.azurerm_public_ip.vm.ip_address}"
}
