output "redshift_cluster_arn" {
  description = "ARN of cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.arn, [""]), 0)
}
output "redshift_cluster_id" {
  description = "The Redshift Cluster ID"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.id, [""]), 0)
}
output "redshift_cluster_cluster_identifier" {
  description = "The Cluster Identifier"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_identifier, [""]), 0)
}
output "redshift_cluster_cluster_type" {
  description = "The cluster type"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_type, [""]), 0)
}
output "redshift_cluster_node_type" {
  description = "The type of nodes in the cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.node_type, [""]), 0)
}
output "redshift_cluster_database_name" {
  description = "The name of the default database in the Cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.database_name, [""]), 0)
}
output "redshift_cluster_availability_zone" {
  description = "The availability zone of the Cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.availability_zone, [""]), 0)
}
output "redshift_cluster_automated_snapshot_retention_period" {
  description = "The backup retention period"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.automated_snapshot_retention_period, [""]), 0)
}
output "redshift_cluster_preferred_maintenance_window" {
  description = "The backup window"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.preferred_maintenance_window, [""]), 0)
}
output "redshift_cluster_endpoint" {
  description = "The connection endpoint"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.endpoint, [""]), 0)
}
output "redshift_cluster_encrypted" {
  description = "Whether the data in the cluster is encrypted"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.encrypted, [""]), 0)
}
output "redshift_cluster_cluster_security_groups" {
  description = "The security groups associated with the cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_security_groups, [""]), 0)
}
output "redshift_cluster_vpc_security_group_ids" {
  description = "The VPC security group Ids associated with the cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.vpc_security_group_ids, [""]), 0)
}
output "redshift_cluster_dns_name" {
  description = "The DNS name of the cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.dns_name, [""]), 0)
}
output "redshift_cluster_port" {
  description = "Cluster response port"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.port, [""]), 0)
}
output "redshift_cluster_cluster_version" {
  description = "Redshift engine software version"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_version, [""]), 0)
}
output "redshift_cluster_cluster_parameter_group_name" {
  description = "The name of the parameter group to be associated with this cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_parameter_group_name, [""]), 0)
}
output "redshift_cluster_cluster_subnet_group_name" {
  description = "The name of a cluster subnet group to be associated with this cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_subnet_group_name, [""]), 0)
}
output "redshift_cluster_cluster_public_key" {
  description = "Cluster public key"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_public_key, [""]), 0)
}
output "redshift_cluster_cluster_revision_number" {
  description = "The specific revision number of the database in the cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_revision_number, [""]), 0)
}
output "redshift_cluster_cluster_nodes" {
  description = "The nodes in the cluster"
  value       = element(concat(aws_redshift_cluster.redshift_cluster.*.cluster_nodes, [""]), 0)
}
