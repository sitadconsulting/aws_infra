output "customerprofiles_domain_arn" {
  description = "ARN of the Customer Profiles Domain"
  value       = element(concat(aws_customerprofiles_domain.customerprofiles_domain.*.arn, [""]), 0)
}
output "customerprofiles_domain_id" {
  description = "The identifier of the Customer Profiles Domain"
  value       = element(concat(aws_customerprofiles_domain.customerprofiles_domain.*.id, [""]), 0)
}
