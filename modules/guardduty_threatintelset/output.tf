output "guardduty_threatintelset_arn" {
  description = "ARN of the GuardDuty ThreatIntelSet"
  value       = element(concat(aws_guardduty_threatintelset.guardduty_threatintelset.*.arn, [""]), 0)
}
output "guardduty_threatintelset_threat_intel_set_id" {
  description = "ID of the GuardDuty ThreatIntelSet"
  value       = element(concat(aws_guardduty_threatintelset.guardduty_threatintelset.*.threat_intel_set_id, [""]), 0)
}
