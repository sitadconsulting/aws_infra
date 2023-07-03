output "quicksight_ingestion_arn" {
  description = "ARN of the Ingestion"
  value       = element(concat(aws_quicksight_ingestion.quicksight_ingestion.*.arn, [""]), 0)
}
output "quicksight_ingestion_id" {
  description = "A comma-delimited string joining AWS account ID, data set ID, and ingestion ID"
  value       = element(concat(aws_quicksight_ingestion.quicksight_ingestion.*.id, [""]), 0)
}
output "quicksight_ingestion_ingestion_status" {
  description = "Ingestion status"
  value       = element(concat(aws_quicksight_ingestion.quicksight_ingestion.*.ingestion_status, [""]), 0)
}
