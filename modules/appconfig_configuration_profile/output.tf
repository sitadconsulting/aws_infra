output "appconfig_configuration_profile_arn" {
  description = "ARN of the AppConfig Configuration Profile"
  value       = element(concat(aws_appconfig_configuration_profile.appconfig_configuration_profile.*.arn, [""]), 0)
}
output "appconfig_configuration_profile_configuration_profile_id" {
  description = "Configuration profile ID"
  value       = element(concat(aws_appconfig_configuration_profile.appconfig_configuration_profile.*.configuration_profile_id, [""]), 0)
}
output "appconfig_configuration_profile_id" {
  description = "AppConfig configuration profile ID and application ID separated by a colon (:)"
  value       = element(concat(aws_appconfig_configuration_profile.appconfig_configuration_profile.*.id, [""]), 0)
}
