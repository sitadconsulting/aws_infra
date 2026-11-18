output "dax_subnet_group_id" {
  description = "The name of the subnet group"
  value       = element(concat(aws_dax_subnet_group.dax_subnet_group.*.id, [""]), 0)
}
output "dax_subnet_group_vpc_id" {
  description = "VPC ID of the subnet group"
  value       = element(concat(aws_dax_subnet_group.dax_subnet_group.*.vpc_id, [""]), 0)
}
