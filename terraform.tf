variable "domain_name" {
  type = string
}

variable "certificate_arn" {
  type = string
}

provider "aws" {
}

terraform {
  backend "s3" {
    bucket = "hedberg-terraform-states"
    key    = "designkod"
    region = "eu-north-1"
  }
}

module "website" {
  source          = "./.deploy/terraform/"
  domain_name     = var.domain_name
  certificate_arn = var.certificate_arn
}
