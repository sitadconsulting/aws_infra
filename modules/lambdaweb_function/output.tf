output "lambdaweb_function_arn" {
  description = "ARN of the function"
  value       = element(concat(aws_lambdaweb_function.lambdaweb_function.*.arn, [""]), 0)
}
