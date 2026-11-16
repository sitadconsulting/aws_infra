output "datazone_user_profile_details" {
  description = "Details about the user profile"
  value       = element(concat(aws_datazone_user_profile.datazone_user_profile.*.details, [""]), 0)
}
output "datazone_user_profile_id" {
  description = "The user profile identifier"
  value       = element(concat(aws_datazone_user_profile.datazone_user_profile.*.id, [""]), 0)
}
output "datazone_user_profile_type" {
  description = "The user profile type"
  value       = element(concat(aws_datazone_user_profile.datazone_user_profile.*.type, [""]), 0)
}
