output "ip" {
  value = aws_instance.vm_instance.public_ip
}

output "ssh_connection_string" {
  value = "ssh -i ${var.ssh_priv_key_file} ubuntu@${aws_instance.vm_instance.public_ip}"
}
