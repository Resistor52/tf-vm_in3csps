# AWS Outputs
output "aws_ip" {
  description = "The public IP address of the AWS virtual machine"
  value = module.aws.ip
}

output "aws_ssh_connection_string" {
  description = "The SSH command to connect to the AWS virtual machine"
  value = module.aws.ssh_connection_string
}

# Azure Outputs
output "az_ip" {
  description = "The public IP address of the Azure virtual machine"
  value = module.azure.ip
}

output "az_ssh_connection_string" {
  description = "The SSH command to connect to the Azure virtual machine"
  value = module.azure.ssh_connection_string
}

# GCP Outputs
output "gcp_ip" {
  description = "The public IP address of the GCP virtual machine"
  value = module.gcp.ip
}

output "gcp_ssh_connection_string" {
  description = "The SSH command to connect to the GCP virtual machine"
  value = module.gcp.ssh_connection_string
}
