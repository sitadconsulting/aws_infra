output "msk_cluster_policy_id" {
  description = "Same as cluster_arn"
  value       = element(concat(aws_msk_cluster_policy.msk_cluster_policy.*.id, [""]), 0)
}
