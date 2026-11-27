output "lexv2models_intent_creation_date_time" {
  description = "Timestamp of the date and time that the intent was created"
  value       = element(concat(aws_lexv2models_intent.lexv2models_intent.*.creation_date_time, [""]), 0)
}
output "lexv2models_intent_id" {
  description = "Composite identifier of intent_id:bot_id:bot_version:locale_id"
  value       = element(concat(aws_lexv2models_intent.lexv2models_intent.*.id, [""]), 0)
}
output "lexv2models_intent_intent_id" {
  description = "Unique identifier for the intent"
  value       = element(concat(aws_lexv2models_intent.lexv2models_intent.*.intent_id, [""]), 0)
}
output "lexv2models_intent_last_updated_date_time" {
  description = "Timestamp of the last time that the intent was modified"
  value       = element(concat(aws_lexv2models_intent.lexv2models_intent.*.last_updated_date_time, [""]), 0)
}
