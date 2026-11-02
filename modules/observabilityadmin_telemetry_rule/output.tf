output "observabilityadmin_telemetry_rule_rule_arn" {
  description = "ARN of the telemetry rule"
  value       = element(concat(aws_observabilityadmin_telemetry_rule.observabilityadmin_telemetry_rule.*.rule_arn, [""]), 0)
}
