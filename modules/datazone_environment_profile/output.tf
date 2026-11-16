output "datazone_environment_profile_created_at" {
  description = "Creation time of environment profile"
  value       = element(concat(aws_datazone_environment_profile.datazone_environment_profile.*.created_at, [""]), 0)
}
output "datazone_environment_profile_created_by" {
  description = "Creator of environment profile"
  value       = element(concat(aws_datazone_environment_profile.datazone_environment_profile.*.created_by, [""]), 0)
}
output "datazone_environment_profile_id" {
  description = "ID of environment profile"
  value       = element(concat(aws_datazone_environment_profile.datazone_environment_profile.*.id, [""]), 0)
}
output "datazone_environment_profile_updated_at" {
  description = "Time of last update to environment profile"
  value       = element(concat(aws_datazone_environment_profile.datazone_environment_profile.*.updated_at, [""]), 0)
}
