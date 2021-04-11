#Deploy a basic ubuntu EC2 t3micro webserver using a module

terraform {
  required_providers {
      aws = {
          source= "hashicorp/aws"
          version="3.7"
      }
  }
}

provider "aws"{
  profile="ownaws"
  region="us-east-1"
}

module "ec2"{
    source="./modules/ec2"
    servername="jhterraec2"
    size="t3.micro"
}
