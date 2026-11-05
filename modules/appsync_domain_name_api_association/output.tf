output "appsync_domain_name_api_association_id" {
  description = "AppSync domain name"
  value       = element(concat(aws_appsync_domain_name_api_association.appsync_domain_name_api_association.*.id, [""]), 0)
}
