output "dms_replication_instance_replication_instance_arn" {
  description = "ARN of the replication instance"
  value       = element(concat(aws_dms_replication_instance.dms_replication_instance.*.replication_instance_arn, [""]), 0)
}
output "dms_replication_instance_replication_instance_private_ips" {
  description = "A list of the private IP addresses of the replication instance"
  value       = element(concat(aws_dms_replication_instance.dms_replication_instance.*.replication_instance_private_ips, [""]), 0)
}
output "dms_replication_instance_replication_instance_public_ips" {
  description = "A list of the public IP addresses of the replication instance"
  value       = element(concat(aws_dms_replication_instance.dms_replication_instance.*.replication_instance_public_ips, [""]), 0)
}
