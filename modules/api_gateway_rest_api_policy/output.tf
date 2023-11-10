output "api_gateway_rest_api_policy_id" {
  description = "REST API ID"
  value       = element(concat(aws_api_gateway_rest_api_policy.api_gateway_rest_api_policy.*.id, [""]), 0)
}

