provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "${var.env_prefix}-vpc"
  }
}

module "myapp-subnet" {
  source = "./modules/subnet"
  subnet_cidr_block = var.subnet_cidr_block
  avail_zone = var.avail_zone
  env_prefix = var.env_prefix
  vpc_id = aws_vpc.myapp-vpc.id
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
}

module "myapp-webserver" {
  source = "./modules/webserver"
  vpc_id = aws_vpc.myapp-vpc.id 
  env_prefix = var.env_prefix
  image_name = var.image_name
  avail_zone = var.avail_zone
  my_public_key_location = var.my_public_key_location
  instance_type = var.instance_type
  subnet_id = module.myapp-subnet.subnet.id
}

