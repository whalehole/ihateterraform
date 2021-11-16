terraform {
  required_version = "= 1.0.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.54"
    }
  }

  backend "s3" {
    region  = "ap-southeast-1"
    bucket  = "terraform-state-bucket-supreme"
    key     = "ihateterraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}