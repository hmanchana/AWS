variable "region" {
  type = string
}
variable "env" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "az" {
  type = list(string)
}
variable "public" {
  type = list(string)
}
variable "private" {
  type = list(string)
}
variable "destination_cidr_block" {
  type = string
}