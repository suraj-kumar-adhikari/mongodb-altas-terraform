terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.3"
    }

    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.10"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.cloud_region
}

provider "mongodbatlas" {
  public_key  = var.atlas_api_public_key
  private_key = var.atlas_api_private_key
}
