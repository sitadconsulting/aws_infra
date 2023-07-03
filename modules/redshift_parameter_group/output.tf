output "redshift_parameter_group_arn" {
  description = "ARN of parameter group"
  value       = element(concat(aws_redshift_parameter_group.redshift_parameter_group.*.arn, [""]), 0)
}
output "redshift_parameter_group_id" {
  description = "Redshift parameter group name"
  value       = element(concat(aws_redshift_parameter_group.redshift_parameter_group.*.id, [""]), 0)
}
