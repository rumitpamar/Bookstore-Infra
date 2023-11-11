provider "aws" {
  access_key = "AKIASTN2GOGQQU4ZYRH6"
  secret_key = "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"
  region     = var.region
}


terraform {
  backend "s3" {

    bucket  = "main-project-bucket"
    key     = "bookstore/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}