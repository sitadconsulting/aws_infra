output "lexv2models_bot_locale_id" {
  description = "Comma-delimited string joining locale_id, bot_id, and bot_version"
  value       = element(concat(aws_lexv2models_bot_locale.lexv2models_bot_locale.*.id, [""]), 0)
}
output "lexv2models_bot_locale_name" {
  description = "Specified locale name"
  value       = element(concat(aws_lexv2models_bot_locale.lexv2models_bot_locale.*.name, [""]), 0)
}
