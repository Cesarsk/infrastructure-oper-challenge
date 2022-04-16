terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.38.0"
    }
  }
  backend "s3" {
    region               = "eu-central-1"
    bucket               = "oper-terraform-state"
    key                  = "terraform.tfstate"
    workspace_key_prefix = "terraform"
  }
}

provider "aws" {
  region = "eu-central-1"
}

provider "kubernetes" {
  host           = var.cluster_endpoint
  config_path    = "~/.kube/config"
}

resource "kubernetes_namespace" "oper" {
  metadata {
    name = "oper"
  }
}