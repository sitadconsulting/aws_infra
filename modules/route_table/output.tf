output "public_route_table_id" {
  description = "ID of public route table"
  value       = element(concat(aws_route_table.route_table.*.id, [""]), 0)
}
output "private_route_table_id" {
  description = "ID of private route table"
  value       = element(concat(aws_route_table.route_table.*.id, [""]), 0)
}
output "public_route_table_arn" {
  description = "ARN of public route table"
  value       = element(concat(aws_route_table.route_table.*.arn, [""]), 0)
}
output "private_route_table_arn" {
  description = "ARN of private route table"
  value       = element(concat(aws_route_table.route_table.*.arn, [""]), 0)
}
