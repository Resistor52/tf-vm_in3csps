output "ip" {
  description = "The public IP address of the virtual machine"
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

output "ssh_connection_string" {
  description = "The SSH command to connect to the virtual machine"
  value = "ssh -i ${var.ssh_priv_key_file} ${var.ssh_user}@${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
}
