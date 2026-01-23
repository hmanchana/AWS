resource "aws_eip" "nat" {
  count  = length(var.az)
  domain = "vpc"

  tags = {
    Name = "nat-eip-${var.az[count.index]}-${var.env}"
  }
}
resource "aws_nat_gateway" "this" {
  count = length(var.az)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]

  tags = {
    Name = "${var.env}-nat-${var.az[count.index]}"
  }
}

