output "docdb_global_cluster_arn" {
  description = "Global Cluster ARN"
  value       = element(concat(aws_docdb_global_cluster.docdb_global_cluster.*.arn, [""]), 0)
}
output "docdb_global_cluster_global_cluster_members" {
  description = "Set of objects containing Global Cluster members"
  value       = element(concat(aws_docdb_global_cluster.docdb_global_cluster.*.global_cluster_members, [""]), 0)
}
output "docdb_global_cluster_global_cluster_resource_id" {
  description = "Set of objects containing Global Cluster members"
  value       = element(concat(aws_docdb_global_cluster.docdb_global_cluster.*.global_cluster_resource_id, [""]), 0)
}
output "docdb_global_cluster_id" {
  description = "DocumentDB Global Cluster ID"
  value       = element(concat(aws_docdb_global_cluster.docdb_global_cluster.*.id, [""]), 0)
}
