# Terrform Architect For Simple Project
Deploy a simple project that install httpd and show webserver hello world

![architecture](architecture.png)

### Install Terraform
```sh
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
mkdir ~/bin
ln -s ~/.tfenv/bin/* ~/bin
tfenv install 1.6.2
tfenv use 1.6.2
```

## Instructions
- when you create an ec2 instance using terrform and you decide to update the instance for example
modify user-data in this case terrform will not replace the instance by default so better you have to pass flag like so:
```sh
terrafrom apply --auto-approve --replace=aws_instance.web
```
## Network Side
```yaml
# scenario 1
resource "aws_internet_gateway_attachment" "attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.this.id
}

# scenario 2
resource "aws_internet_gateway" "igw" {
  tags = {
    Name = "main-igw"
  }
}
```
- We are not using both scenario in defnining the network of the internet gateway
so we  use first scenario when you don't need to assigen the igw immediatly

- how do I let the IP and public-dns of the ec2 instanc to show
you need to update the vpc by
```
resource "aws_vpc" "this" {
  cidr_block = "172.31.0.0/16"
  enable_dns_support   = true   
  enable_dns_hostnames = true
}
```
and  also add to the subnet:
``map_public_ip_on_launch = true``

## Uset Tags
- you can define tags on provider level so that can be assign to each resource you  had:
```
provider "aws" {
    default_tags {
        tags = {
            Environment = "demo"
            Project     = "demo"
        }
    }
}
```

## Authentication 
- first  create a aws profile and then import it to the aws provider config

```sh
# setup the profile  in aws
aws configure --profile prod

provider "aws" {
    shared_config_files      = ["~/.aws/config"]
    shared_credentials_files = ["~/.aws/credentails"]
    profile                  = "prod"  
}
```
- destroy spasific profile
```sh
AWS_PROFILE=prod terraform destroy --auto-approve
```

![alt text](image.png)