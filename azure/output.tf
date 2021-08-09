output "ip" {
  value = azurerm_public_ip.hitc.ip_address
}

output "ssh_connection_string" {
  value = "ssh -i ${var.ssh_priv_key_file} ${var.ssh_user}@${azurerm_public_ip.hitc.ip_address}"
}
