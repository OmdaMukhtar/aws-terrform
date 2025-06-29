terraform {
  backend "s3" {
    key = "web-server"
    bucket = "terraform-backend-terraformbackends3bucket-ykndtip5fke8"
    region = "us-east-1"
    dynamodb_table = "terraform-backend-TerraformBackendDynamoDBTable-MHZH7M44HSIL"
  }
}