provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "vm" {
  ami           = "ami-09e4ba81d75ebeb6a"
  subnet_id     = "subnet-0cb72216ffb1351a7"
  instance_type = "t3.micro"
  tags = {
    Name = "my-first-tf-node"
  }
}