output "macie2_account_created_at" {
  description = "Date and time, in UTC and extended RFC 3339 format, when the Amazon Macie account was created"
  value       = element(concat(aws_macie2_account.macie2_account.*.created_at, [""]), 0)
}
output "macie2_account_id" {
  description = "Unique identifier (ID) of the Macie account"
  value       = element(concat(aws_macie2_account.macie2_account.*.id, [""]), 0)
}
output "macie2_account_service_role" {
  description = "ARN of the service-linked role that allows Macie to monitor and analyze data in AWS resources for the account"
  value       = element(concat(aws_macie2_account.macie2_account.*.service_role, [""]), 0)
}
output "macie2_account_updated_at" {
  description = "Date and time, in UTC and extended RFC 3339 format, of the most recent change to the status of the Macie account"
  value       = element(concat(aws_macie2_account.macie2_account.*.updated_at, [""]), 0)
}
