output "applicationinsights_application_arn" {
  description = "ARN of the Application"
  value       = element(concat(aws_applicationinsights_application.applicationinsights_application.*.arn, [""]), 0)
}
output "applicationinsights_application_id" {
  description = "Name of the resource group"
  value       = element(concat(aws_applicationinsights_application.applicationinsights_application.*.id, [""]), 0)
}
