output "msk_replicator_arn" {
  description = "ARN of the Replicator"
  value       = element(concat(aws_msk_replicator.msk_replicator.*.arn, [""]), 0)
}
output "msk_replicator_current_version" {
  description = "Current version of the MSK Replicator"
  value       = element(concat(aws_msk_replicator.msk_replicator.*.current_version, [""]), 0)
}
