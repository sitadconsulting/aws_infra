output "dynamodb_table_export_arn" {
  description = "ARN of the Table Export"
  value       = element(concat(aws_dynamodb_table_export.dynamodb_table_export.*.arn, [""]), 0)
}
output "dynamodb_table_export_billed_size_in_bytes" {
  description = "Billable size of the table export"
  value       = element(concat(aws_dynamodb_table_export.dynamodb_table_export.*.billed_size_in_bytes, [""]), 0)
}
output "dynamodb_table_export_end_time" {
  description = "Time at which the export task completed"
  value       = element(concat(aws_dynamodb_table_export.dynamodb_table_export.*.end_time, [""]), 0)
}
output "dynamodb_table_export_export_status" {
  description = "Status of the export - export can be in one of the following states IN_PROGRESS, COMPLETED, or FAILED"
  value       = element(concat(aws_dynamodb_table_export.dynamodb_table_export.*.export_status, [""]), 0)
}
output "dynamodb_table_export_item_count" {
  description = "Number of items exported"
  value       = element(concat(aws_dynamodb_table_export.dynamodb_table_export.*.item_count, [""]), 0)
}
output "dynamodb_table_export_manifest_files_s3_key" {
  description = "Name of the manifest file for the export task"
  value       = element(concat(aws_dynamodb_table_export.dynamodb_table_export.*.manifest_files_s3_key, [""]), 0)
}
output "dynamodb_table_export_start_time" {
  description = "Time at which the export task began"
  value       = element(concat(aws_dynamodb_table_export.dynamodb_table_export.*.start_time, [""]), 0)
}
