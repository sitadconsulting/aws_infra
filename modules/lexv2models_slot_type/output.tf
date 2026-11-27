output "lexv2models_slot_type_id" {
  description = "Comma-delimited string concatenating bot_id, bot_version, locale_id, and slot_type_id"
  value       = element(concat(aws_lexv2models_slot_type.lexv2models_slot_type.*.id, [""]), 0)
}
output "lexv2models_slot_type_slot_type_id" {
  description = "Unique identifier for the slot type"
  value       = element(concat(aws_lexv2models_slot_type.lexv2models_slot_type.*.slot_type_id, [""]), 0)
}
