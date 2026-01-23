variable "env" {
  type = string
}
variable "az" {
  type = list(string)
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}