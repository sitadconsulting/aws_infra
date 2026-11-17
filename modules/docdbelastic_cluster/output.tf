output "docdbelastic_cluster_arn" {
  description = "ARN of the DocumentDB Elastic Cluster"
  value       = element(concat(aws_docdbelastic_cluster.docdbelastic_cluster.*.arn, [""]), 0)
}
output "docdbelastic_cluster_endpoint" {
  description = "The DNS address of the DocDB instance"
  value       = element(concat(aws_docdbelastic_cluster.docdbelastic_cluster.*.endpoint, [""]), 0)
}
