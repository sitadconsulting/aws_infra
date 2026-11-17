output "docdb_cluster_arn" {
  description = "ARN of cluster"
  value       = element(concat(aws_docdb_cluster.docdb_cluster.*.arn, [""]), 0)
}
output "docdb_cluster_cluster_members" {
  description = "List of DocumentDB Instances that are a part of this cluster"
  value       = element(concat(aws_docdb_cluster.docdb_cluster.*.cluster_members, [""]), 0)
}
output "docdb_cluster_cluster_resource_id" {
  description = "The DocumentDB Cluster Resource ID"
  value       = element(concat(aws_docdb_cluster.docdb_cluster.*.cluster_resource_id, [""]), 0)
}
output "docdb_cluster_endpoint" {
  description = "The DNS address of the DocumentDB instance"
  value       = element(concat(aws_docdb_cluster.docdb_cluster.*.endpoint, [""]), 0)
}
output "docdb_cluster_hosted_zone_id" {
  description = "The Route53 Hosted Zone ID of the endpoint"
  value       = element(concat(aws_docdb_cluster.docdb_cluster.*.hosted_zone_id, [""]), 0)
}
output "docdb_cluster_reader_endpoint" {
  description = "A read-only endpoint for the DocumentDB cluster, automatically load-balanced across replicas"
  value       = element(concat(aws_docdb_cluster.docdb_cluster.*.reader_endpoint, [""]), 0)
}
