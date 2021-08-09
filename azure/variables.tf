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

variable "azure_location" {
  description = "The region of Azure resource group for this HitC Exercise"
  type = string
}
