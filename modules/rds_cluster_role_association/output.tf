output "rds_cluster_role_association_id" {
  description = "DB Cluster Identifier and IAM Role ARN separated by a comma"
  value       = element(concat(aws_rds_cluster_role_association.rds_cluster_role_association.*.id, [""]), 0)
}
