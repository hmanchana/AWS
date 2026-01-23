resource "aws_route_table" "public" {
  vpc_id = var.vpc_id  

  tags = {
    Name = "rt-public-${var.env}"
  }
}
resource "aws_route" "Public_Internet_Access" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id = var.igw_id  
}
resource "aws_route_table_association" "public_subnet" {
  count = length(var.az)
  subnet_id = var.public_subnet_ids[count.index].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name = "rt-private-${var.env}"
  }  
}
resource "aws_route" "Private_Nat_Access" {
  count = length(var.az)
  route_table_id = aws_route_table.private.id
  destination_cidr_block = var.destination_cidr_block
  nat_gateway_id = var.nat_id[count.index]
}
resource "aws_route_table_association" "private_subnet" {
  count = length(var.az)
  route_table_id = aws_route_table.private.id
  subnet_id = var.private_subnet_ids[count.index]
}