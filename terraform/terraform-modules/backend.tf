terraform {
  backend "s3" {
    key = "web-server"
    bucket = "terraform-backend-terraformbackends3bucket-el1irmchlzdc"
    region = "us-east-1"
    dynamodb_table = "terraform-backend-TerraformBackendDynamoDBTable-1VN5472I3FQAS"
  }
}