output "dlm_lifecycle_policy_arn" {
  description = "ARN of the DLM Lifecycle Policy"
  value       = element(concat(aws_dlm_lifecycle_policy.dlm_lifecycle_policy.*.arn, [""]), 0)
}
output "dlm_lifecycle_policy_id" {
  description = "Identifier of the DLM Lifecycle Policy"
  value       = element(concat(aws_dlm_lifecycle_policy.dlm_lifecycle_policy.*.id, [""]), 0)
}
