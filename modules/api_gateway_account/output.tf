output "api_gateway_account_api_key_version" {
  description = "The version of the API keys used for the account"
  value       = element(concat(aws_api_gateway_account.api_gateway_account.*.api_key_version, [""]), 0)
}
output "api_gateway_account_api_throttle_settings" {
  description = "Account-Level throttle settings"
  value       = element(concat(aws_api_gateway_account.api_gateway_account.*.throttle_settings, [""]), 0)
}
output "api_gateway_account_api_features" {
  description = "A list of features supported for the account"
  value       = element(concat(aws_api_gateway_account.api_gateway_account.*.features, [""]), 0)
}
