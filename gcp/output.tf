output "ip" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

output "ssh_connection_string" {
  value = "ssh -i ${var.ssh_priv_key_file} ${var.gce_ssh_user}@${aws_instance.vm_instance.public_ip}"
}
