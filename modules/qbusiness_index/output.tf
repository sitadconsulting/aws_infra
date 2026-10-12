output "qbusiness_index_created_at" {
  description = "The Unix timestamp when the index was created"
  value       = element(concat(awscc_qbusiness_index.qbusiness_index.*.created_at, [""]), 0)
}
output "qbusiness_index_index_arn" {
  description = "ARN of an Amazon Q Business index"
  value       = element(concat(awscc_qbusiness_index.qbusiness_index.*.index_arn, [""]), 0)
}
output "qbusiness_index_index_id" {
  description = "The identifier for the index"
  value       = element(concat(awscc_qbusiness_index.qbusiness_index.*.index_id, [""]), 0)
}
output "qbusiness_index_status" {
  description = "The current status of the index. When the status is ACTIVE, the index is ready"
  value       = element(concat(awscc_qbusiness_index.qbusiness_index.*.status, [""]), 0)
}
output "qbusiness_index_updated_at" {
  description = "The Unix timestamp when the index was last updated"
  value       = element(concat(awscc_qbusiness_index.qbusiness_index.*.updated_at, [""]), 0)
}
