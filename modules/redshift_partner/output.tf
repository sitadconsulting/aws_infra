output "redshift_partner_id" {
  description = "The identifier of the Redshift partner, account_id, cluster_identifier, database_name, partner_name separated by a colon (:)."
  value       = element(concat(aws_redshift_partner.redshift_partner.*.id, [""]), 0)
}
output "redshift_partner_status" {
  description = "The partner integration status"
  value       = element(concat(aws_redshift_partner.redshift_partner.*.status, [""]), 0)
}
output "redshift_partner_status_message" {
  description = "The status message provided by the partner"
  value       = element(concat(aws_redshift_partner.redshift_partner.*.status_message, [""]), 0)
}
