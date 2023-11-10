output "api_gateway_usage_plan_key_id" {
  description = "Usage plan key ID"
  value       = element(concat(aws_api_gateway_usage_plan_key.api_gateway_usage_plan_key.*.id, [""]), 0)
}
output "api_gateway_usage_plan_key_key_id" {
  description = "API gateway key resource ID"
  value       = element(concat(aws_api_gateway_usage_plan_key.api_gateway_usage_plan_key.*.key_id, [""]), 0)
}
output "api_gateway_usage_plan_key_key_type" {
  description = "Type of a usage plan key. Currently, the valid key type is API_KEY"
  value       = element(concat(aws_api_gateway_usage_plan_key.api_gateway_usage_plan_key.*.key_type, [""]), 0)
}
output "api_gateway_usage_plan_key_usage_plan_id" {
  description = "API resource ID"
  value       = element(concat(aws_api_gateway_usage_plan_key.api_gateway_usage_plan_key.*.usage_plan_id, [""]), 0)
}
output "api_gateway_usage_plan_key_name" {
  description = "Name of a usage plan key"
  value       = element(concat(aws_api_gateway_usage_plan_key.api_gateway_usage_plan_key.*.name, [""]), 0)
}
output "api_gateway_usage_plan_key_value" {
  description = "Value of a usage plan key"
  value       = element(concat(aws_api_gateway_usage_plan_key.api_gateway_usage_plan_key.*.value, [""]), 0)
}
