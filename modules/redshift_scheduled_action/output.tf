output "redshift_scheduled_action_id" {
  description = "Redshift Scheduled Action name"
  value       = element(concat(aws_redshift_scheduled_action.redshift_scheduled_action.*.id, [""]), 0)
}
