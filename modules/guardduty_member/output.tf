output "guardduty_member_relationship_status" {
  description = "Status of the relationship between the member account and its primary account"
  value       = element(concat(aws_guardduty_member.guardduty_member.*.relationship_status, [""]), 0)
}
