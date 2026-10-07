output "grafana_license_association_free_trial_expiration" {
  description = "If license_type is set to ENTERPRISE_FREE_TRIAL, this is the expiration date of the free trial"
  value       = element(concat(aws_grafana_license_association.grafana_license_association.*.free_trial_expiration, [""]), 0)
}
output "grafana_license_association_license_expiration" {
  description = "If license_type is set to ENTERPRISE, this is the expiration date of the enterprise license"
  value       = element(concat(aws_grafana_license_association.grafana_license_association.*.license_expiration, [""]), 0)
}
