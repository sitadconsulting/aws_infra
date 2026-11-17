output "docdb_subnet_group_arn" {
  description = "The ARN of the DocDB subnet group"
  value       = element(concat(aws_docdb_subnet_group.docdb_subnet_group.*.arn, [""]), 0)
}
output "docdb_subnet_group_id" {
  description = "The DocDB subnet group name"
  value       = element(concat(aws_docdb_subnet_group.docdb_subnet_group.*.id, [""]), 0)
}
output "docdb_subnet_group_supported_network_types" {
  description = "The network type of the DocDB subnet group (IPV4 or DUAL)"
  value       = element(concat(aws_docdb_subnet_group.docdb_subnet_group.*.supported_network_types, [""]), 0)
}
