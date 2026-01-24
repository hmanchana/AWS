module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  private_cidr_subnet = var.public_cidr_subnet
  public_cidr_subnet = var.public_cidr_subnet
  az = var.az
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source = "./modules/Nat_Gateway"
  public_cidr_subnet = var.public_cidr_subnet
}

