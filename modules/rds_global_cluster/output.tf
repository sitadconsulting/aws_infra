output "rds_global_cluster_arn" {
  description = "ARN of the RDS Global Cluster"
  value       = element(concat(aws_rds_global_cluster.rds_global_cluster.*.arn, [""]), 0)
}
output "rds_global_cluster_global_cluster_members" {
  description = "Set of objects containing Global Cluster members"
  value       = element(concat(aws_rds_global_cluster.rds_global_cluster.*.global_cluster_members, [""]), 0)
}
output "rds_global_cluster_global_cluster_resource_id" {
  description = "AWS Region-unique, immutable identifier for the global database cluster. This identifier is found in AWS CloudTrail log entries whenever the AWS KMS key for the DB cluster is accessed"
  value       = element(concat(aws_rds_global_cluster.rds_global_cluster.*.global_cluster_resource_id, [""]), 0)
}
output "rds_global_cluster_id" {
  description = "RDS Global Cluster identifier"
  value       = element(concat(aws_rds_global_cluster.rds_global_cluster.*.id, [""]), 0)
}
