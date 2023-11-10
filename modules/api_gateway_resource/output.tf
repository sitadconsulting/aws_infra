output "api_gateway_resource_id" {
  description = "Resource's identifier"
  value       = element(concat(aws_api_gateway_resource.api_gateway_resource.*.id, [""]), 0)
}
output "api_gateway_resource_path" {
  description = "Complete path for this API resource, including all parent paths"
  value       = element(concat(aws_api_gateway_resource.api_gateway_resource.*.path, [""]), 0)
}
