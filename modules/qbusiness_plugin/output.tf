output "qbusiness_plugin_build_status" {
  description = "The current status of a plugin. A plugin is modified asynchronously"
  value       = element(concat(awscc_qbusiness_plugin.qbusiness_plugin.*.build_status, [""]), 0)
}
output "qbusiness_plugin_created_at" {
  description = "The timestamp for when the plugin was created"
  value       = element(concat(awscc_qbusiness_plugin.qbusiness_plugin.*.created_at, [""]), 0)
}
output "qbusiness_plugin_plugin_arn" {
  description = "ARN of a plugin"
  value       = element(concat(awscc_qbusiness_plugin.qbusiness_plugin.*.plugin_arn, [""]), 0)
}
output "qbusiness_plugin_plugin_id" {
  description = "Plugin ID"
  value       = element(concat(awscc_qbusiness_plugin.qbusiness_plugin.*.plugin_id, [""]), 0)
}
output "qbusiness_plugin_updated_at" {
  description = "The timestamp for when the plugin was last updated"
  value       = element(concat(awscc_qbusiness_plugin.qbusiness_plugin.*.updated_at, [""]), 0)
}
