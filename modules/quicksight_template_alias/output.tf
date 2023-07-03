output "quicksight_template_alias_arn" {
  description = "ARN of the template alias"
  value       = element(concat(aws_quicksight_template_alias.quicksight_template_alias.*.arn, [""]), 0)
}
output "quicksight_template_alias_id" {
  description = "A comma-delimited string joining AWS account ID, template ID, and alias name"
  value       = element(concat(aws_quicksight_template_alias.quicksight_template_alias.*.id, [""]), 0)
}
