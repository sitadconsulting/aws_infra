output "msk_replicator_arn" {
  description = "ARN of the Replicator"
  value       = element(concat(aws_msk_replicator.msk_replicator.*.arn, [""]), 0)
}
