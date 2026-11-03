output "observabilityadmin_telemetry_rule_for_organization_rule_arn" {
  description = "ARN of the organization telemetry rule"
  value       = element(concat(aws_observabilityadmin_telemetry_rule_for_organization.observabilityadmin_telemetry_rule_for_organization.*.rule_arn, [""]), 0)
}
