output "appsync_api_arn" {
  description = "ARN of the Event API"
  value       = element(concat(aws_appsync_api.appsync_api.*.arn, [""]), 0)
}
output "appsync_api_api_id" {
  description = "ID of the Event API"
  value       = element(concat(aws_appsync_api.appsync_api.*.api_id, [""]), 0)
}
output "appsync_api_dns" {
  description = "DNS configuration for the Event API"
  value       = element(concat(aws_appsync_api.appsync_api.*.dns, [""]), 0)
}
output "appsync_api_waf_web_acl_arn" {
  description = "ARN of the associated WAF web ACL"
  value       = element(concat(aws_appsync_api.appsync_api.*.waf_web_acl_arn, [""]), 0)
}
output "appsync_api_xray_enabled" {
  description = "Whether X-Ray tracing is enabled for the Event API"
  value       = element(concat(aws_appsync_api.appsync_api.*.xray_enabled, [""]), 0)
}
