output "quicksight_user_arn" {
  description = "ARN of the user"
  value       = element(concat(aws_quicksight_user.quicksight_user.*.arn, [""]), 0)
}
