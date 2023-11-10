output "api_gateway_api_key_id" {
  description = "API key ID"
  value       = element(concat(aws_api_gateway_api_key.api_gateway_api_key.*.id, [""]), 0)
}
output "api_gateway_api_key_created_date" {
  description = "Creation date of the API key"
  value       = element(concat(aws_api_gateway_api_key.api_gateway_api_key.*.created_date, [""]), 0)
}
output "api_gateway_api_last_updated_date" {
  description = "Last update date of the API key"
  value       = element(concat(aws_api_gateway_api_key.api_gateway_api_key.*.last_updated_date, [""]), 0)
}
output "api_gateway_account_arn" {
  description = "API key  ARN"
  value       = element(concat(aws_api_gateway_api_key.api_gateway_api_key.*.arn, [""]), 0)
}
