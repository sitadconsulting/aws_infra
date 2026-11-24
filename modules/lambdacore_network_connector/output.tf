output "lambdacore_network_connector_arn" {
  description = "ARN of the network connector"
  value       = element(concat(aws_lambdacore_network_connector.lambdacore_network_connector.*.arn, [""]), 0)
}
output "lambdacore_network_connector_latest_version" {
  description = "Number of the connector's latest version. Each configuration change creates a new immutable version"
  value       = element(concat(aws_lambdacore_network_connector.lambdacore_network_connector.*.latest_version, [""]), 0)
}
output "lambdacore_network_connector_latest_version_arn" {
  description = "Version-qualified ARN of the connector's latest version. Use it for service_config.egress_network_connector_arn on an aws_lambdaweb_function_revision resource"
  value       = element(concat(aws_lambdacore_network_connector.lambdacore_network_connector.*.latest_version_arn, [""]), 0)
}
