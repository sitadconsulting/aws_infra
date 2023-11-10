output "api_gateway_request_validator_id" {
  description = "Model ID"
  value       = element(concat(aws_api_gateway_request_validator.api_gateway_request_validator.*.id, [""]), 0)
}
