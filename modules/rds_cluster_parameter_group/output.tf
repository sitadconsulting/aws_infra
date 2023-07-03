output "rds_cluster_parameter_group_id" {
  description = "DB cluster parameter group name"
  value       = element(concat(aws_rds_cluster_parameter_group.rds_cluster_parameter_group.*.id, [""]), 0)
}
output "rds_cluster_parameter_group_arn" {
  description = "ARN of the db cluster parameter group"
  value       = element(concat(aws_rds_cluster_parameter_group.rds_cluster_parameter_group.*.arn, [""]), 0)
}
