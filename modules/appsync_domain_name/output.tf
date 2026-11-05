output "appsync_domain_name_appsync_domain_name" {
  description = "Domain name that AppSync provides"
  value       = element(concat(aws_appsync_domain_name.appsync_domain_name.*.appsync_domain_name, [""]), 0)
}
output "appsync_domain_name_hosted_zone_id" {
  description = "ID of your Amazon Route 53 hosted zone"
  value       = element(concat(aws_appsync_domain_name.appsync_domain_name.*.hosted_zone_id, [""]), 0)
}
output "appsync_domain_name_id" {
  description = "AppSync Domain Name"
  value       = element(concat(aws_appsync_domain_name.appsync_domain_name.*.id, [""]), 0)
}
