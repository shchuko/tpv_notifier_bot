provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "tpv-notifier-terraform-state"
    key    = "tpv-notifier-terraform-state"
  }
}