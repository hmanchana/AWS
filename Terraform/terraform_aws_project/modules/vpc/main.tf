resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    name = "vpc-${var.env}"
  }
}
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.main.id
  tags = {
    name = "vpc-${var.env}"
  }
}
