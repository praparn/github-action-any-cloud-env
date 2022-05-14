# AWS Provider source and version being used
terraform {

  backend "s3" {
    bucket = "praparn-github-action-any-cloud-env"
    key    = "2.Instance-k8s_2022-2022-05-14-15-43-15.tfstate"
    region = "ap-southeast-1"
    encrypt = true
  }
}

provider "aws" {
    access_key = var.access_key // TF_VAR_access_key="YOUR_ACCESS_KEY"
    secret_key = var.secret_key // TF_VAR_secret_key="YOUR_SECRET_KEY"
    region = var.region // TF_VAR_region="YOUR REGION"
}