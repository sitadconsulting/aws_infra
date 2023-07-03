output "rds_cluster_endpoint_arn" {
  description = "ARN of cluster"
  value       = element(concat(aws_rds_cluster_endpoint.rds_cluster_endpoint.*.arn, [""]), 0)
}
output "rds_cluster_endpoint_id" {
  description = "RDS Cluster Endpoint Identifier"
  value       = element(concat(aws_rds_cluster_endpoint.rds_cluster_endpoint.*.id, [""]), 0)
}
output "rds_cluster_endpoint_endpoint" {
  description = "Custom endpoint for the Aurora cluster"
  value       = element(concat(aws_rds_cluster_endpoint.rds_cluster_endpoint.*.endpoint, [""]), 0)
}
