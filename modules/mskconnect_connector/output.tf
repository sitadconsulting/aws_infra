output "mskconnect_connector_arn" {
  description = "ARN of the connector"
  value       = element(concat(aws_mskconnect_connector.mskconnect_connector.*.arn, [""]), 0)
}
output "mskconnect_connector_version" {
  description = "The current version of the connector"
  value       = element(concat(aws_mskconnect_connector.mskconnect_connector.*.version, [""]), 0)
}
