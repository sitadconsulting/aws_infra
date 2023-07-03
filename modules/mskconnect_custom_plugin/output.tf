output "mskconnect_custom_plugin_arn" {
  description = "ARN of the custom plugin"
  value       = element(concat(aws_mskconnect_custom_plugin.mskconnect_custom_plugin.*.arn, [""]), 0)
}
output "mskconnect_custom_plugin_latest_revision" {
  description = "ID of the latest successfully created revision of the custom plugin"
  value       = element(concat(aws_mskconnect_custom_plugin.mskconnect_custom_plugin.*.latest_revision, [""]), 0)
}
output "mskconnect_custom_plugin_state" {
  description = "The state of the custom plugin"
  value       = element(concat(aws_mskconnect_custom_plugin.mskconnect_custom_plugin.*.state, [""]), 0)
}
