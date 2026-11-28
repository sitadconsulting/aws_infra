output "macie2_member_administrator_account_id" {
  description = "AWS account ID for the administrator account"
  value       = element(concat(aws_macie2_member.macie2_member.*.administrator_account_id, [""]), 0)
}
output "macie2_member_arn" {
  description = "ARN of the account"
  value       = element(concat(aws_macie2_member.macie2_member.*.arn, [""]), 0)
}
output "macie2_member_id" {
  description = "Unique identifier (ID) of the Macie Member"
  value       = element(concat(aws_macie2_member.macie2_member.*.id, [""]), 0)
}
output "macie2_member_invited_at" {
  description = "Date and time, in UTC and extended RFC 3339 format, when an Amazon Macie membership invitation was last sent to the account. This value is null if a Macie invitation hasn't been sent to the account"
  value       = element(concat(aws_macie2_member.macie2_member.*.invited_at, [""]), 0)
}
output "macie2_member_master_account_id" {
  description = "AWS account ID for the master account"
  value       = element(concat(aws_macie2_member.macie2_member.*.master_account_id, [""]), 0)
}
output "macie2_member_relationship_status" {
  description = "Current status of the relationship between the account and the administrator account"
  value       = element(concat(aws_macie2_member.macie2_member.*.relationship_status, [""]), 0)
}
output "macie2_member_updated_at" {
  description = "Date and time, in UTC and extended RFC 3339 format, of the most recent change to the status of the relationship between the account and the administrator account"
  value       = element(concat(aws_macie2_member.macie2_member.*.updated_at, [""]), 0)
}
