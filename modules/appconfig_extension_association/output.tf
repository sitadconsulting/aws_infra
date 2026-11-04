output "appconfig_extension_association_arn" {
  description = "ARN of the AppConfig Extension Association"
  value       = element(concat(aws_appconfig_extension_association.appconfig_extension_association.*.arn, [""]), 0)
}
output "appconfig_extension_association_extension_version" {
  description = "Version number for the extension defined in the association"
  value       = element(concat(aws_appconfig_extension_association.appconfig_extension_association.*.extension_version, [""]), 0)
}
output "appconfig_extension_association_id" {
  description = "AppConfig Extension Association ID"
  value       = element(concat(aws_appconfig_extension_association.appconfig_extension_association.*.id, [""]), 0)
}
