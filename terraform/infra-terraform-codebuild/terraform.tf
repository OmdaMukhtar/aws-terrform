terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }
}

provider "aws" {
    default_tags {
        tags = {
            Environment = "demo"
            Project     = "demo-project"
        }
    }
}