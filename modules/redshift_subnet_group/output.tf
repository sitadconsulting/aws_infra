output "redshift_subnet_group_arn" {
  description = "ARN of the Redshift Subnet group name"
  value       = element(concat(aws_redshift_subnet_group.redshift_subnet_group.*.arn, [""]), 0)
}
output "redshift_subnet_group_id" {
  description = "Redshift Subnet group ID"
  value       = element(concat(aws_redshift_subnet_group.redshift_subnet_group.*.id, [""]), 0)
}
