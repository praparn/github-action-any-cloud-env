# AWS Provider source and version being used
terraform {

  backend "s3" {
    bucket = "praparn-github-action-any-cloud-env"
    key    = "<keyname>"
    region = "ap-southeast-1"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }
}

provider "aws" {
    access_key = var.access_key // TF_VAR_access_key="YOUR_ACCESS_KEY"
    secret_key = var.secret_key // TF_VAR_secret_key="YOUR_SECRET_KEY"
    region = var.region // TF_VAR_region="YOUR REGION"
}