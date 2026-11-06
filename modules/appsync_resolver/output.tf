output "appsync_resolver_arn" {
  description = "Resolver ARN"
  value       = element(concat(aws_appsync_resolver.appsync_resolver.*.arn, [""]), 0)
}
