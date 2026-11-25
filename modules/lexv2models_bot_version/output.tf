output "lexv2models_bot_version_bot_version" {
  description = "Version number assigned to the version"
  value       = element(concat(aws_lexv2models_bot_version.lexv2models_bot_version.*.bot_version, [""]), 0)
}
output "lexv2models_bot_version_id" {
  description = "A comma-delimited string concatenating bot_id and bot_version"
  value       = element(concat(aws_lexv2models_bot_version.lexv2models_bot_version.*.id, [""]), 0)
}
