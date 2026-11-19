output "emrserverless_application_arn" {
  description = "ARN of the application"
  value       = element(concat(aws_emrserverless_application.emrserverless_application.*.arn, [""]), 0)
}
output "emrserverless_application_id" {
  description = "The ID of the application"
  value       = element(concat(aws_emrserverless_application.emrserverless_application.*.id, [""]), 0)
}
