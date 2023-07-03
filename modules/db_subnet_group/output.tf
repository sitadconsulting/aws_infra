output "db_subnet_group_id" {
  description = "DB subnet group name"
  value       = element(concat(aws_db_subnet_group.db_subnet_group.*.id, [""]), 0)
}
output "db_subnet_group_arn" {
  description = "ARN of the db subnet group"
  value       = element(concat(aws_db_subnet_group.db_subnet_group.*.arn, [""]), 0)
}
output "db_subnet_group_supported_network_type" {
  description = "The network type of the db subnet group"
  value       = element(concat(aws_db_subnet_group.db_subnet_group.*.supported_network_type, [""]), 0)
}
output "db_subnet_group_vpc_id" {
  description = "Provides the VPC ID of the DB subnet group"
  value       = element(concat(aws_db_subnet_group.db_subnet_group.*.vpc_id, [""]), 0)
}
