terraform {
  backend "s3" {
    key = "web-server"
    bucket = "terraform-backend-terraformbackends3bucket-pwceago1ktr3"
    region = "us-east-1"
    dynamodb_table = "terraform-backend-TerraformBackendDynamoDBTable-1NDE34U7LAO1V"
  }
}
