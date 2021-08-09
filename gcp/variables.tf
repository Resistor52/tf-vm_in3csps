variable "ssh_user" {
  description = "The local user account to create on the virtual machine"
  type = string
}

variable "ssh_pub_key_file" {
  description = "The path to the public SSH key associated with the local user account"
  type = string
}

variable "ssh_priv_key_file" {
  description = "The path to the private SSH key associated with the local user account"
  type = string
}

variable "gcp_project" {
  description = "The GCP Project ID to deploy the VM"
}

variable "gcp_region" {
  description = "The GCP Region to deploy the VM"
}

variable "gcp_zone" {
  description = "The GCP Zone to deploy the VM"
}

variable "gcp_key_file" {
  description = "The path to the GCP Ser4vice Account"
}
