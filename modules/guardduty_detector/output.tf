output "guardduty_detector_account_id" {
  description = "AWS account ID of the GuardDuty detector"
  value       = element(concat(aws_guardduty_detector.guardduty_detector.*.account_id, [""]), 0)
}
output "guardduty_detector_arn" {
  description = "ARN of the GuardDuty detector"
  value       = element(concat(aws_guardduty_detector.guardduty_detector.*.arn, [""]), 0)
}
output "guardduty_detector_id" {
  description = "ID of the GuardDuty detector"
  value       = element(concat(aws_guardduty_detector.guardduty_detector.*.id, [""]), 0)
}
