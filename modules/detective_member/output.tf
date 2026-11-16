output "detective_member_administrator_id" {
  description = "AWS account ID for the administrator account"
  value       = element(concat(aws_detective_member.detective_member.*.administrator_id, [""]), 0)
}
output "detective_member_id" {
  description = "Unique identifier (ID) of the Detective"
  value       = element(concat(aws_detective_member.detective_member.*.id, [""]), 0)
}
output "detective_member_invited_time" {
  description = "Date and time, in UTC and extended RFC 3339 format, when an Amazon Detective membership invitation was last sent to the account"
  value       = element(concat(aws_detective_member.detective_member.*.invited_time, [""]), 0)
}
output "detective_member_status" {
  description = "Current membership status of the member account"
  value       = element(concat(aws_detective_member.detective_member.*.status, [""]), 0)
}
output "detective_member_updated_time" {
  description = "Date and time, in UTC and extended RFC 3339 format, of the most recent change to the member account's status"
  value       = element(concat(aws_detective_member.detective_member.*.updated_time, [""]), 0)
}
output "detective_member_volume_usage_in_bytes" {
  description = "Data volume in bytes per day for the member account"
  value       = element(concat(aws_detective_member.detective_member.*.volume_usage_in_bytes, [""]), 0)
}
