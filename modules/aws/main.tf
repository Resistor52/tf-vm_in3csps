terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = var.aws_creds_file
  profile                 = var.aws_profile
}

data "http" "myip" {
  url = "https://api.ipify.org"
}
