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
  region=var.region
}

module "ec2"{
    source="../../"
    servername=var.servername
    size="t3.micro"
}
