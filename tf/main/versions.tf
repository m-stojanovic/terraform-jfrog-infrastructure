terraform {
  required_version = ">= 1.0.8"
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "6.6.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}