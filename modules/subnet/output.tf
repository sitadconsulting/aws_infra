output "public_subnet_id" {
  description = "List of IDs for public subnets"
  value       = element(concat(aws_subnet.subnet.*.id, [""]), 0)
}
output "private_subnet_id" {
  description = "List of IDs for private subnets"
  value       = element(concat(aws_subnet.subnet.*.id, [""]), 0)
}
output "public_subnet_arns" {
  description = "List of ARNs for public subnets"
  value       = element(concat(aws_subnet.subnet.*.arn, [""]), 0)
}
output "private_subnet_arns" {
  description = "List of ARNs for private subnets"
  value       = element(concat(aws_subnet.subnet.*.arn, [""]), 0)
}
