output "lambdaweb_function_endpoint_arn" {
  description = "ARN of the endpoint in the format arn:aws:lambda:{region}:{account}:web-function/{function_name}/endpoint/{endpoint_name}"
  value       = element(concat(aws_lambdaweb_function_endpoint.lambdaweb_function_endpoint.*.arn, [""]), 0)
}
output "lambdaweb_function_endpoint_domain_name" {
  description = "HTTPS domain name of the endpoint. Empty for PerRegion endpoints, which only expose regional_domain_names"
  value       = element(concat(aws_lambdaweb_function_endpoint.lambdaweb_function_endpoint.*.domain_name, [""]), 0)
}
output "lambdaweb_function_endpoint_regional_domain_names" {
  description = "Map of Region to that Region's independent domain name"
  value       = element(concat(aws_lambdaweb_function_endpoint.lambdaweb_function_endpoint.*.regional_domain_names, [""]), 0)
}
