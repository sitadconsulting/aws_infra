output "kinesis_account_settings_earliest_allowed_end_at" {
  description = "Earliest timestamp when the commitment can be ended"
  value       = element(concat([for v in aws_kinesis_account_settings.kinesis_account_settings.*.minimum_throughput_billing_commitment[0]: v.earliest_allowed_end_at ], [""]), 0)
}
output "kinesis_account_settings_ended_at" {
  description = "Timestamp when the commitment was ended"
  value       = element(concat([for v in aws_kinesis_account_settings.kinesis_account_settings.*.minimum_throughput_billing_commitment[0]: v.ended_at ], [""]), 0)
}
output "kinesis_account_settings_started_at" {
  description = "Timestamp when the commitment was started"
  value       = element(concat([for v in aws_kinesis_account_settings.kinesis_account_settings.*.minimum_throughput_billing_commitment[0]: v.started_at ], [""]), 0)
}
output "kinesis_account_settings_status_actual" {
  description = "Current status of the minimum throughput billing commitment. Values: ENABLED, DISABLED, ENABLED_UNTIL_EARLIEST_ALLOWED_END"
  value       = element(concat([for v in aws_kinesis_account_settings.kinesis_account_settings.*.minimum_throughput_billing_commitment[0]: v.status_actual ], [""]), 0)
}
