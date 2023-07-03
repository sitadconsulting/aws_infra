output "msk_serverless_cluster_arn" {
  description = "ARN of the MSK serverless cluster"
  value       = element(concat(aws_msk_serverless_cluster.msk_serverless_cluster.*.arn, [""]), 0)
}
