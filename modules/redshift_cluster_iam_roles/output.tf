output "redshift_cluster_id" {
  description = "Redshift Cluster ID"
  value       = element(concat(aws_redshift_cluster_iam_roles.redshift_cluster_iam_roles.*.id, [""]), 0)
}
