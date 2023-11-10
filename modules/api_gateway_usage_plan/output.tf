output "api_gateway_usage_plan_id" {
  description = "Model ID"
  value       = element(concat(aws_api_gateway_usage_plan.api_gateway_usage_plan.*.id, [""]), 0)
}
output "api_gateway_usage_plan_name" {
  description = "Name of the usage plan"
  value       = element(concat(aws_api_gateway_usage_plan.api_gateway_usage_plan.*.name, [""]), 0)
}
output "api_gateway_usage_plan_description" {
  description = "Description of a usage plan"
  value       = element(concat(aws_api_gateway_usage_plan.api_gateway_usage_plan.*.description, [""]), 0)
}
output "api_gateway_usage_plan_api_stages" {
  description = "Associated API stages of the usage plan"
  value       = element(concat(aws_api_gateway_usage_plan.api_gateway_usage_plan.*.api_stages, [""]), 0)
}
output "api_gateway_usage_plan_quota_settings" {
  description = "Quota of the usage plan"
  value       = element(concat(aws_api_gateway_usage_plan.api_gateway_usage_plan.*.quota_settings, [""]), 0)
}
output "api_gateway_usage_plan_throttle_settings" {
  description = "Throttling limits of the usage plan"
  value       = element(concat(aws_api_gateway_usage_plan.api_gateway_usage_plan.*.throttle_settings, [""]), 0)
}
output "api_gateway_usage_plan_product_code" {
  description = "AWS Marketplace product identifier to associate with the usage plan as a SaaS product on AWS Marketplace"
  value       = element(concat(aws_api_gateway_usage_plan.api_gateway_usage_plan.*.product_code, [""]), 0)
}
output "api_gateway_usage_plan_arn" {
  description = "Usage Plan ARN"
  value       = element(concat(aws_api_gateway_usage_plan.api_gateway_usage_plan.*.arn, [""]), 0)
}
