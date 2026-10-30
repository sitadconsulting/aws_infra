output "cloudwatch_alarm_mute_rule_arn" {
  description = "ARN of the Alarm Mute Rule"
  value       = element(concat(aws_cloudwatch_alarm_mute_rule.cloudwatch_alarm_mute_rule.*.arn, [""]), 0)
}
output "cloudwatch_alarm_mute_rule_last_updated_timestamp" {
  description = "Timestamp of when the mute rule was last updated"
  value       = element(concat(aws_cloudwatch_alarm_mute_rule.cloudwatch_alarm_mute_rule.*.last_updated_timestamp, [""]), 0)
}
output "cloudwatch_alarm_mute_rule_mute_type" {
  description = "Indicates whether the mute rule is one-time or recurring. Valid values are ONE_TIME or RECURRING"
  value       = element(concat(aws_cloudwatch_alarm_mute_rule.cloudwatch_alarm_mute_rule.*.mute_type, [""]), 0)
}
output "cloudwatch_alarm_mute_rule_status" {
  description = "Current status of the mute rule. Valid values are SCHEDULED, ACTIVE, or EXPIRED"
  value       = element(concat(aws_cloudwatch_alarm_mute_rule.cloudwatch_alarm_mute_rule.*.status, [""]), 0)
}
