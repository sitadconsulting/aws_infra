output "db_proxy_default_target_group_rds_db_proxy_name" {
  description = "Name of the RDS DB Proxy"
  value       = element(concat(aws_db_proxy_default_target_group.db_proxy_default_target_group.*.id, [""]), 0)
}
output "db_proxy_default_target_group_arn" {
  description = "ARN of the target group"
  value       = element(concat(aws_db_proxy_default_target_group.db_proxy_default_target_group.*.arn, [""]), 0)
}
output "db_proxy_default_target_group_name" {
  description = "The name of the default target group"
  value       = element(concat(aws_db_proxy_default_target_group.db_proxy_default_target_group.*.name, [""]), 0)
}
