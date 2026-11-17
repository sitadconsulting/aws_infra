output "docdb_cluster_parameter_group_arn" {
  description = "The ARN of the DocumentDB cluster parameter group"
  value       = element(concat(aws_docdb_cluster_parameter_group.docdb_cluster_parameter_group.*.arn, [""]), 0)
}
output "docdb_cluster_parameter_group_id" {
  description = "The DocumentDB cluster parameter group name"
  value       = element(concat(aws_docdb_cluster_parameter_group.docdb_cluster_parameter_group.*.id, [""]), 0)
}
