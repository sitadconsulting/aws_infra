output "appfabric_ingestion_arn" {
  description = "ARN of the Ingestion"
  value       = element(concat(aws_appfabric_ingestion.appfabric_ingestion.*.arn, [""]), 0)
}
