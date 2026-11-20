output "guardduty_filter_arn" {
  description = "ARN of the GuardDuty filter"
  value       = element(concat(aws_guardduty_filter.guardduty_filter.*.arn, [""]), 0)
}
