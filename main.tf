module "aws" {
  aws_region = var.aws_region
  aws_creds_file = var.aws_creds_file
  aws_profile = var.aws_profile
  ssh_pub_key_file = var.ssh_pub_key_file
  ssh_priv_key_file = var.ssh_priv_key_file
  source = "./modules/aws"
}

module "azure" {
  ssh_user = var.ssh_user
  azure_location = var.azure_location
  ssh_pub_key_file = var.ssh_pub_key_file
  ssh_priv_key_file = var.ssh_priv_key_file
  source = "./modules/azure"
}

module "gcp" {
  gcp_project = var.gcp_project
  gcp_region = var.gcp_region
  gcp_zone = var.gcp_zone
  gcp_key_file = var.gcp_key_file
  ssh_pub_key_file = var.ssh_pub_key_file
  ssh_priv_key_file = var.ssh_priv_key_file
  source = "./modules/gcp"
}
