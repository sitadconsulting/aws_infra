output "macie2_custom_data_identifier_arn" {
  description = "ARN of the custom data identifier"
  value       = element(concat(aws_macie2_custom_data_identifier.macie2_custom_data_identifier.*.arn, [""]), 0)
}
output "macie2_custom_data_identifier_created_at" {
  description = "Date and time, in UTC and extended RFC 3339 format, when the custom data identifier was created"
  value       = element(concat(aws_macie2_custom_data_identifier.macie2_custom_data_identifier.*.created_at, [""]), 0)
}
output "macie2_custom_data_identifier_id" {
  description = "Unique identifier (ID) of the Macie custom data identifier"
  value       = element(concat(aws_macie2_custom_data_identifier.macie2_custom_data_identifier.*.id, [""]), 0)
}
