output "acm_arn" {
  description = "ARN of this acm certificate"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.arn, [""]), 0)
}
output "acm_id" {
  description = "ARN of this acm certificate"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.id, [""]), 0)
}
output "acm_domain_name" {
  description = "Domain name for which the certificate is issued"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.domain_name, [""]), 0)
}
output "acm_domain_validation_options" {
  description = "Set of domain validation objects which can be used to complete certificate validation. Can have more than one element, e.g., if SANs are defined"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.domain_validation_options, [""]), 0)
}
output "acm_pending_renewal" {
  description = "true if a Private certificate eligible for managed renewal is within the early_renewal_duration period"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.pending_renewal, [""]), 0)
}
output "acm_not_after" {
  description = "Expiration date and time of the certificate"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.not_after, [""]), 0)
}
output "acm_not_before" {
  description = "Start of the validity period of the certificate"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.not_before, [""]), 0)
}
output "acm_renewal_eligibility" {
  description = "Whether the certificate is eligible for managed renewal"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.renewal_eligibility, [""]), 0)
}
output "acm_renewal_summary" {
  description = "Contains information about the status of ACM's managed renewal for the certificate"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.renewal_summary, [""]), 0)
}
output "acm_status" {
  description = "Status of the certificate"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.status, [""]), 0)
}
output "acm_type" {
  description = "Source of the certificate"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.type, [""]), 0)
}
output "acm_validation_emails" {
  description = "List of addresses that received a validation email. Only set if EMAIL validation was used"
  value       = element(concat(aws_acm_certificate.acm_certificate.*.validation_emails, [""]), 0)
}
