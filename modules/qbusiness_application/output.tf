output "qbusiness_application_application_arn" {
  description = "ARN of the Amazon Q Business application"
  value       = element(concat(awscc_qbusiness_application.qbusiness_application.*.application_arn, [""]), 0)
}
output "qbusiness_application_application_id" {
  description = "ID of the Amazon Q Business application"
  value       = element(concat(awscc_qbusiness_application.qbusiness_application.*.application_id, [""]), 0)
}
output "qbusiness_application_id" {
  description = "ID of the Amazon Q Business application"
  value       = element(concat(awscc_qbusiness_application.qbusiness_application.*.id, [""]), 0)
}
output "qbusiness_application_created_at" {
  description = "The Unix timestamp when the Amazon Q Business application was created"
  value       = element(concat(awscc_qbusiness_application.qbusiness_application.*.created_at, [""]), 0)
}
output "qbusiness_application_identity_center_application_arn" {
  description = "ARN of the AWS IAM Identity Center instance attached to your Amazon Q Business application"
  value       = element(concat(awscc_qbusiness_application.qbusiness_application.*.identity_center_application_arn, [""]), 0)
}
output "qbusiness_application_status" {
  description = "The status of the Amazon Q Business application. The application is ready to use when the status is ACTIVE"
  value       = element(concat(awscc_qbusiness_application.qbusiness_application.*.status, [""]), 0)
}
output "qbusiness_application_updated_at" {
  description = "The Unix timestamp when the Amazon Q Business application was last updated"
  value       = element(concat(awscc_qbusiness_application.qbusiness_application.*.updated_at, [""]), 0)
}
