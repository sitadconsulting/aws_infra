output "quicksight_group_arn" {
  description = "ARN of the group"
  value       = element(concat(aws_quicksight_group.quicksight_group.*.arn, [""]), 0)
}
