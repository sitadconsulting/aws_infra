output "observabilityadmin_telemetry_evaluation_for_organization_failure_reason" {
  description = "Reason for the failure status. Only populated if status is FAILED_START or FAILED_STOP"
  value       = element(concat(aws_observabilityadmin_telemetry_evaluation_for_organization.observabilityadmin_telemetry_evaluation_for_organization.*.failure_reason, [""]), 0)
}
output "observabilityadmin_telemetry_evaluation_for_organization_home_region" {
  description = "AWS Region designated as the home region for multi-region telemetry evaluation. Only present when multi-region evaluation is active"
  value       = element(concat(aws_observabilityadmin_telemetry_evaluation_for_organization.observabilityadmin_telemetry_evaluation_for_organization.*.home_region, [""]), 0)
}
output "observabilityadmin_telemetry_evaluation_for_organization_status" {
  description = "Onboarding status of the telemetry config feature for the organization. Valid values: NOT_STARTED, STARTING, FAILED_START, RUNNING, STOPPING, FAILED_STOP, STOPPED"
  value       = element(concat(aws_observabilityadmin_telemetry_evaluation_for_organization.observabilityadmin_telemetry_evaluation_for_organization.*.status, [""]), 0)
}
