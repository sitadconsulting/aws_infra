output "qbusiness_data_source_created_at" {
  description = "The Unix timestamp when the Amazon Q Business data source was created"
  value       = element(concat(awscc_qbusiness_data_source.qbusiness_data_source.*.created_at, [""]), 0)
}
output "qbusiness_data_source_data_source_arn" {
  description = "ARN of a data source in an Amazon Q Business application"
  value       = element(concat(awscc_qbusiness_data_source.qbusiness_data_source.*.data_source_arn, [""]), 0)
}
output "qbusiness_data_source_data_source_id" {
  description = "ID of the Amazon Q Business data source"
  value       = element(concat(awscc_qbusiness_data_source.qbusiness_data_source.*.data_source_id, [""]), 0)
}
output "qbusiness_data_source_status" {
  description = "The status of the Amazon Q Business data source"
  value       = element(concat(awscc_qbusiness_data_source.qbusiness_data_source.*.status, [""]), 0)
}
output "qbusiness_data_source_type" {
  description = "The type of the Amazon Q Business data source"
  value       = element(concat(awscc_qbusiness_data_source.qbusiness_data_source.*.type, [""]), 0)
}
output "qbusiness_data_source_updated_at" {
  description = "The Unix timestamp when the Amazon Q Business data source was last updated"
  value       = element(concat(awscc_qbusiness_data_source.qbusiness_data_source.*.updated_at, [""]), 0)
}
