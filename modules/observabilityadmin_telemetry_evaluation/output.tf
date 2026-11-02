output "observabilityadmin_telemetry_evaluation_failure_reason" {
  description = "Reason for the failure status. Only populated if status is FAILED_START or FAILED_STOP"
  value       = element(concat(aws_observabilityadmin_telemetry_evaluation.observabilityadmin_telemetry_evaluation.*.failure_reason, [""]), 0)
}
output "observabilityadmin_telemetry_evaluation_status" {
  description = "Onboarding status of the telemetry config feature. Valid values: NOT_STARTED, STARTING, FAILED_START, RUNNING, STOPPING, FAILED_STOP, STOPPED"
  value       = element(concat(aws_observabilityadmin_telemetry_evaluation.observabilityadmin_telemetry_evaluation.*.status, [""]), 0)
}
