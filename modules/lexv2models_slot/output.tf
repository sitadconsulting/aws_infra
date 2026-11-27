output "lexv2models_slot_id" {
  description = "A comma-delimited string concatenating bot_id, bot_version, intent_id, locale_id, and slot_id"
  value       = element(concat(aws_lexv2models_slot.lexv2models_slot.*.id, [""]), 0)
}
output "lexv2models_slot_slot_id" {
  description = "Unique identifier associated with the slot"
  value       = element(concat(aws_lexv2models_slot.lexv2models_slot.*.slot_id, [""]), 0)
}
