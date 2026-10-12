output "qbusiness_retriever_created_at" {
  description = "The Unix timestamp when the retriever was created"
  value       = element(concat(awscc_qbusiness_retriever.qbusiness_retriever.*.created_at, [""]), 0)
}
output "qbusiness_retriever_retriever_arn" {
  description = "ARN of the IAM role associated with the retriever"
  value       = element(concat(awscc_qbusiness_retriever.qbusiness_retriever.*.retriever_arn, [""]), 0)
}
output "qbusiness_retriever_retriever_id" {
  description = "ID of the retriever used by your Amazon Q Business application"
  value       = element(concat(awscc_qbusiness_retriever.qbusiness_retriever.*.retriever_id, [""]), 0)
}
output "qbusiness_retriever_status" {
  description = "The status of your retriever"
  value       = element(concat(awscc_qbusiness_retriever.qbusiness_retriever.*.status, [""]), 0)
}
output "qbusiness_retriever_updated_at" {
  description = "The Unix timestamp when the retriever was last updated"
  value       = element(concat(awscc_qbusiness_retriever.qbusiness_retriever.*.updated_at, [""]), 0)
}
