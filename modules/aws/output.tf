output "ip" {
  description = "The public IP address of the virtual machine"
  value = aws_instance.vm_instance.public_ip
}

output "ssh_connection_string" {
  description = "The SSH command to connect to the virtual machine"
  value = "ssh -i ${var.ssh_priv_key_file} ubuntu@${aws_instance.vm_instance.public_ip}"
}
