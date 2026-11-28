output "msk_serverless_cluster_arn" {
  description = "ARN of the MSK serverless cluster"
  value       = element(concat(aws_msk_serverless_cluster.msk_serverless_cluster.*.arn, [""]), 0)
}
output "msk_serverless_cluster_bootstrap_brokers_sasl_iam" {
  description = "One or more DNS names (or IP addresses) and SASL IAM port pairs. For example, boot-abcdefg.c2.kafka-serverless.eu-central-1.amazonaws.com:9098. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_serverless_cluster.msk_serverless_cluster.*.bootstrap_brokers_sasl_iam, [""]), 0)
}
output "msk_serverless_cluster_cluster_uuid" {
  description = "UUID of the serverless cluster, for use in IAM policies"
  value       = element(concat(aws_msk_serverless_cluster.msk_serverless_cluster.*.cluster_uuid, [""]), 0)
}
