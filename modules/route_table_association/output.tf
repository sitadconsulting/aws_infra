output "public_route_table_association_id" {
  description = "List of IDs of the public route table association"
  value       = element(concat(aws_route_table_association.route_table_association.*.id, [""]), 0)
}
output "private_route_table_association_id" {
  description = "List of IDs of the private route table association"
  value       = element(concat(aws_route_table_association.route_table_association.*.id, [""]), 0)
}
