output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "subnet_ids" {
  value = concat(
    aws_subnet.public[*].id,
    aws_subnet.private[*].id
  )
}
