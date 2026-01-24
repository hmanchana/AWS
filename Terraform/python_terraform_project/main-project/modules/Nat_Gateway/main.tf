resource "aws_eip" "nat" {
  count = length(var.public_cidr_subnet)
  domain = vpc
  tags = {
    Name = "nat-eip-${count.index + 1}-${terraform.workspace}"
  }
}
resource "aws_nat_gateway" "this" {
  count = length(var.public_cidr_subnet)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id = var.public_cidr_subnet[count.index]
  tags = {
    Name = "nat-gateway-${count.index + 1}-${terraform.workspace}"
  }
  depends_on = [ aws_internet_gateway.igw ]
}