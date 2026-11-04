output "appconfig_extension_arn" {
  description = "ARN of the AppConfig Extension"
  value       = element(concat(aws_appconfig_extension.appconfig_extension.*.arn, [""]), 0)
}
output "appconfig_extension_id" {
  description = "AppConfig Extension ID"
  value       = element(concat(aws_appconfig_extension.appconfig_extension.*.id, [""]), 0)
}
output "appconfig_extension_version" {
  description = "Version number for the extension"
  value       = element(concat(aws_appconfig_extension.appconfig_extension.*.version, [""]), 0)
}
