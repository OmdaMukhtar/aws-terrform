terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 5.0" # only version 5.0 
      version = "~> 6.0.0" # version 6.0.0 and above
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

  #    shared_config_files      = ["~/.aws/config"]
  #    shared_credentials_files = ["~/.aws/credentails"]
  #    profile                  = "dev"  
}
