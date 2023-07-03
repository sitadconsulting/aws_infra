output "glue_trigger_arn" {
  description = "ARN of Glue Trigger"
  value       = element(concat(aws_glue_trigger.glue_trigger.*.arn, [""]), 0)
}
output "glue_trigger_id" {
  description = "Trigger name"
  value       = element(concat(aws_glue_trigger.glue_trigger.*.id, [""]), 0)
}
output "glue_trigger_state" {
  description = "Current state of the Trigger"
  value       = element(concat(aws_glue_trigger.glue_trigger.*.state, [""]), 0)
}
