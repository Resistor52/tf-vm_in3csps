variable "aws_region" {
  description = "The AWS region to deploy the resources to"
}

variable "aws_creds_file" {
  description = "The full path to the .aws/credentials file"
}

variable "aws_profile" {
  description = "The profile in the credentials tile to use"
}

variable "ssh_pub_key_file" {
  description = "The path to the public SSH key associated with the local user account"
  type = string
}

variable "ssh_priv_key_file" {
  description = "The path to the private SSH key associated with the local user account"
  type = string
}
