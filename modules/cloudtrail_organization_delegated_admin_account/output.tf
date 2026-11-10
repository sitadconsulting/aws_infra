output "cloudtrail_organization_delegated_admin_account_arn" {
  description = "ARN of the delegated administrator's account"
  value       = element(concat(aws_cloudtrail_organization_delegated_admin_account.cloudtrail_organization_delegated_admin_account.*.arn, [""]), 0)
}
output "cloudtrail_organization_delegated_admin_account_email" {
  description = "The email address that is associated with the delegated administrator's AWS account"
  value       = element(concat(aws_cloudtrail_organization_delegated_admin_account.cloudtrail_organization_delegated_admin_account.*.email, [""]), 0)
}
output "cloudtrail_organization_delegated_admin_account_name" {
  description = "The friendly name of the delegated administrator's account"
  value       = element(concat(aws_cloudtrail_organization_delegated_admin_account.cloudtrail_organization_delegated_admin_account.*.name, [""]), 0)
}
output "cloudtrail_organization_delegated_admin_account_service_principal" {
  description = "The AWS CloudTrail service principal name"
  value       = element(concat(aws_cloudtrail_organization_delegated_admin_account.cloudtrail_organization_delegated_admin_account.*.service_principal, [""]), 0)
}
