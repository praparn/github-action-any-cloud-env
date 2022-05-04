provider "aws" {
    access_key = var.access_key // Set environment variable on your local -->  TF_VAR_access_key="YOUR_ACCESS_KEY"
    secret_key = var.secret_key // Set environment variable on your local -->  TF_VAR_secret_key="YOUR_SECRET_KEY"
    region = var.region
}