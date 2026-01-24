output "public_cidr_subnet" {
  value = aws_subnet.public[*].id
}
output "public_cidr_subnet" {
  value = aws_subnet.private[*].id
}