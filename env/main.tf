terraform {
  required_version = ">= 1.3.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.6.3"
    }
  }
}

provider "sops" {
}

provider "aws" {
  region = "ap-northeast-1"
}

data "sops_file" "test" {
  source_file = "../../modules/ssm/test.env"
}

module "ssm" {
  source       = "../../modules/ssm"
  env          = "test"
  test-secrets = data.sops_file.test
}
