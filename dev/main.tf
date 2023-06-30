provider "aws" {
  region = var.region
}
module "my_vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  tenancy      = var.tenancy
  project_name = var.project_name
}

module "my_ec2" {
  source        = "./modules/ec2"
  ec2_count     = var.ec2_count
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.my_subnet.subnet_id
  #vpc_id        = module.my_vpc.vpc_id
  project_name = var.project_name
}

module "my_subnet" {
  source       = "./modules/subnet"
  vpc_id       = module.my_vpc.vpc_id
  subnet_cidr  = var.subnet_cidr
  project_name = var.project_name
}

module "my_igw" {
  source       = "./modules/igw"
  vpc_id       = module.my_vpc.vpc_id
  project_name = var.project_name
}

module "route_table" {
  source = "./modules/routetable"
  vpc_id = module.my_vpc.vpc_id
  igw_id = module.my_igw.igw_id
  project_name = var.project_name
}
