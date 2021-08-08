provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = var.aws_creds_file
  profile                 = var.aws_profile
}
