resource "aws_subnet" "public" {
  count = length(var.az)
  vpc_id = var.vpc_id
  cidr_block = var.public[count.index]
  availability_zone = var.az[count.index]
  map_public_ip_on_launch = true
  tags = {
    name = "${var.public[count.index]}-subnet-${var.env}"
    Type = "${var.public[count.index]}"
  }
}
resource "aws_subnet" "private" {
  count = length(var.az)
  vpc_id = var.vpc_id
  cidr_block = var.private[count.index]
  availability_zone = var.az[count.index]
  tags = {
    name = "${var.private[count.index]}-subnet-${var.env}"
    type = "${var.private[count.index]}"
  }
}
