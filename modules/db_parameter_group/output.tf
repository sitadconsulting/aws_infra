output "db_parameter_group_name" {
  description = "DB parameter group name"
  value       = element(concat(aws_db_parameter_group.db_parameter_group.*.id, [""]), 0)
}
output "db_parameter_group_arn" {
  description = "ARN of the db parameter group"
  value       = element(concat(aws_db_parameter_group.db_parameter_group.*.arn, [""]), 0)
}

