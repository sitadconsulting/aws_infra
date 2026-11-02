output "observabilityadmin_telemetry_enrichment_aws_resource_explorer_managed_view_arn" {
  description = "ARN of the AWS Resource Explorer managed view created for the telemetry enrichment feature"
  value       = element(concat(aws_observabilityadmin_telemetry_enrichment.observabilityadmin_telemetry_enrichment.*.aws_resource_explorer_managed_view_arn, [""]), 0)
}
