output "ssoadmin_application_application_account" {
  description = "AWS account id"
  value       = element(concat(aws_ssoadmin_application.ssoadmin_application.*.application_account, [""]), 0)
}
output "ssoadmin_application_application_arn" {
  description = "Application ARN"
  value       = element(concat(aws_ssoadmin_application.ssoadmin_application.*.application_arn, [""]), 0)
}
output "ssoadmin_application_arn" {
  description = "Application ARN"
  value       = element(concat(aws_ssoadmin_application.ssoadmin_application.*.arn, [""]), 0)
}
