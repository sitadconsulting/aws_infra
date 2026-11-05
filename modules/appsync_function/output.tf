output "appsync_function_arn" {
  description = "ARN of the Function object"
  value       = element(concat(aws_appsync_function.appsync_function.*.arn, [""]), 0)
}
output "appsync_function_function_id" {
  description = "Unique ID representing the Function object"
  value       = element(concat(aws_appsync_function.appsync_function.*.function_id, [""]), 0)
}
output "appsync_function_id" {
  description = "API Function ID (Formatted as ApiId-FunctionId)"
  value       = element(concat(aws_appsync_function.appsync_function.*.id, [""]), 0)
}
