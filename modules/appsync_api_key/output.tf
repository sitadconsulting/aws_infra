output "appsync_api_key_api_key_id" {
  description = "ID of the API key"
  value       = element(concat(aws_appsync_api_key.appsync_api_key.*.api_key_id, [""]), 0)
}
output "appsync_api_key_id" {
  description = "API Key ID (Formatted as ApiId:Key)"
  value       = element(concat(aws_appsync_api_key.appsync_api_key.*.id, [""]), 0)
}
output "appsync_api_key_key" {
  description = "API key"
  value       = element(concat(aws_appsync_api_key.appsync_api_key.*.key, [""]), 0)
}
