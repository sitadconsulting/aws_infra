output "api_gateway_model_id" {
  description = "Model ID"
  value       = element(concat(aws_api_gateway_model.api_gateway_model.*.id, [""]), 0)
}
