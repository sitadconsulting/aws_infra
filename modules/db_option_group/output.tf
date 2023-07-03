output "db_option_group_name" {
  description = "The db option group name"
  value       = element(concat(aws_db_option_group.db_option_group.*.id, [""]), 0)
}
output "db_option_group_arn" {
  description = "ARN of the db option group"
  value       = element(concat(aws_db_option_group.db_option_group.*.arn, [""]), 0)
}
