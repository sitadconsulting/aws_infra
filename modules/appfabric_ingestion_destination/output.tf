output "appfabric_ingestion_destination_arn" {
  description = "ARN of the Ingestion Destination"
  value       = element(concat(aws_appfabric_ingestion_destination.appfabric_ingestion_destination.*.arn, [""]), 0)
}
