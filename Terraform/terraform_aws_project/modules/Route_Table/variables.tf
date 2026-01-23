variable "vpc_id" {
  type = string
}
variable "destination_cidr_block" {
  type = string
}
variable "env" {
  type = string
}
variable "igw_id" {
  type = string
}
variable "az" {
  type = list(string)
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "nat_id" {
  type = list(string)
}