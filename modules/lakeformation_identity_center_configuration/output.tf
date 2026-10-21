output "lakeformation_identity_center_configuration_application_arn" {
  description = "ARN of the Lake Formation applicated integrated with IAM Identity Center"
  value       = element(concat(aws_lakeformation_identity_center_configuration.lakeformation_identity_center_configuration.*.application_arn, [""]), 0)
}
output "lakeformation_identity_center_configuration_resource_share" {
  description = "ARN of the Resource Access Manager (RAM) resource share"
  value       = element(concat(aws_lakeformation_identity_center_configuration.lakeformation_identity_center_configuration.*.resource_share, [""]), 0)
}
