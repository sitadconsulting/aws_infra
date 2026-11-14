output "datazone_domain_arn" {
  description = "ARN of the Domain"
  value       = element(concat(aws_datazone_domain.datazone_domain.*.arn, [""]), 0)
}
output "datazone_domain_id" {
  description = "ID of the Domain"
  value       = element(concat(aws_datazone_domain.datazone_domain.*.id, [""]), 0)
}
output "datazone_domain_portal_url" {
  description = "URL of the data portal for the Domain"
  value       = element(concat(aws_datazone_domain.datazone_domain.*.portal_url, [""]), 0)
}
output "datazone_domain_root_domain_unit_id" {
  description = "ID of the root domain unit"
  value       = element(concat(aws_datazone_domain.datazone_domain.*.root_domain_unit_id, [""]), 0)
}
