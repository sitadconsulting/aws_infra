output "sns_platform_application_id" {
  description = "The ARN of the SNS platform application"
  value       = element(concat(aws_sns_platform_application.sns_platform_application.*.id, [""]), 0)
}
output "sns_platform_application_arn" {
  description = "The ARN of the SNS platform application"
  value       = element(concat(aws_sns_platform_application.sns_platform_application.*.arn, [""]), 0)
}
