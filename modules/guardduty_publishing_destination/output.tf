output "guardduty_publishing_destination_arn" {
  description = "ARN of the guardduty publishing destination"
  value       = element(concat(aws_guardduty_publishing_destination.guardduty_publishing_destination.*.arn, [""]), 0)
}
output "guardduty_publishing_destination_destination_id" {
  description = "Guardduty publishing destination ID"
  value       = element(concat(aws_guardduty_publishing_destination.guardduty_publishing_destination.*.destination_id, [""]), 0)
}
