output "appconfig_hosted_configuration_version_arn" {
  description = "ARN of the AppConfig hosted configuration version"
  value       = element(concat(aws_appconfig_hosted_configuration_version.appconfig_hosted_configuration_version.*.arn, [""]), 0)
}
output "appconfig_hosted_configuration_version_id" {
  description = "AppConfig application ID, configuration profile ID, and version number separated by a slash (/)"
  value       = element(concat(aws_appconfig_hosted_configuration_version.appconfig_hosted_configuration_version.*.id, [""]), 0)
}
output "appconfig_hosted_configuration_version_version_number" {
  description = "Version number of the hosted configuration"
  value       = element(concat(aws_appconfig_hosted_configuration_version.appconfig_hosted_configuration_version.*.version_number, [""]), 0)
}
