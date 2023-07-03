output "db_proxy_target_rds_db_instance_hostname" {
  description = "Hostname for the target RDS DB Instance. Only returned for RDS_INSTANCE type"
  value       = element(concat(aws_db_proxy_target.db_proxy_target.*.endpoint, [""]), 0)
}
output "db_proxy_target_id" {
  description = "Identifier of db_proxy_name, target_group_name, target type (e.g., RDS_INSTANCE or TRACKED_CLUSTER), and resource identifier separated by forward slashes"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.id, [""]), 0)
}
output "db_proxy_endpoint_port" {
  description = "Port for the target RDS DB Instance or Aurora DB Cluster"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.port, [""]), 0)
}
output "db_proxy_endpoint_rds_resource_id" {
  description = "Identifier representing the DB Instance or DB Cluster target"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.rds_resource_id, [""]), 0)
}
output "db_proxy_endpoint_target_arn" {
  description = "ARN of the DB instance or DB cluster"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.target_arn, [""]), 0)
}
output "db_proxy_endpoint_tracked_cluster_id" {
  description = "DB Cluster identifier for the DB Instance target. Not returned unless manually importing an RDS_INSTANCE target that is part of a DB Cluster"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.tracked_cluster_id, [""]), 0)
}
output "db_proxy_endpoint_target_type" {
  description = "Type of target E.g., RDS_INSTANCE or TRACKED_CLUSTER"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.type, [""]), 0)
}
