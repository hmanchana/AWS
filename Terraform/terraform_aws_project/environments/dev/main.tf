module "Vpc" {
  source = "../../modules/Vpc"
  cidr_block = var.cidr_block
  env = var.env
}
module "Subnets" {
  source = "../../modules/Subnets"
  vpc_id = module.Vpc.vpc_id
  az = var.az
  env = var.env
  public = var.public
  private = var.private
}
module "Nat_Gateway" {
  source = "../../modules/Nat_Gateway" 
  vpc_id = module.Vpc.vpc_id
  az = var.az
  env = var.env
  public = var.public
}
module "Route_Table" {
  source = "../../modules/Route_Table"
  vpc_id = module.Vpc.vpc_id
  az = var.az
  env = var.env
  public = var.public
  private = var.private
  nat_id = module.Nat_Gateway.nat_id
  igw_id = module.Vpc.igw_id
  destination_cidr_block = var.destination_cidr_block
}
