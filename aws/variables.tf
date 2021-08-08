variable "aws_region" {
  description = "The AWS region to deploy the resources to"
}

variable "aws_creds_file" {
  description = "The full path to the .aws/credentials file"
}

variable "aws_profile" {
  description = "The profile in the credentials tile to use"
}

variable "aws_pem" {
  description = "The PEM file to use for SSH. This is outputted with the IP for convenience"
}
