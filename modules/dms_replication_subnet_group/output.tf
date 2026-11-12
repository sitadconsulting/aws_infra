output "dms_replication_subnet_group_vpc_id" {
  description = "The ID of the VPC the subnet group is in"
  value       = element(concat(aws_dms_replication_subnet_group.dms_replication_subnet_group.*.vpc_id, [""]), 0)
}
