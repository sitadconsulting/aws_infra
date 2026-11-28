output "msk_cluster_policy_id" {
  description = "Cluster policy Id"
  value       = element(concat(aws_msk_cluster_policy.msk_cluster_policy.*.id, [""]), 0)
}
output "msk_cluster_policy_current_version" {
  description = "Current version of the policy"
  value       = element(concat(aws_msk_cluster_policy.msk_cluster_policy.*.current_version, [""]), 0)
}
