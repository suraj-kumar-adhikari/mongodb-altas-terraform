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

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }

  required_version = ">= 1.5.0"
}
