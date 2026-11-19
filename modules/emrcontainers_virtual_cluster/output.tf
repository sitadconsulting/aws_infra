output "emrcontainers_virtual_cluster_arn" {
  description = "ARN of the cluster"
  value       = element(concat(aws_emrcontainers_virtual_cluster.emrcontainers_virtual_cluster.*.arn, [""]), 0)
}
output "emrcontainers_virtual_cluster_id" {
  description = "The ID of the cluster"
  value       = element(concat(aws_emrcontainers_virtual_cluster.emrcontainers_virtual_cluster.*.id, [""]), 0)
}
