output "appsync_channel_namespace_channel_namespace_arn" {
  description = "ARN of the channel namespace"
  value       = element(concat(aws_appsync_channel_namespace.appsync_channel_namespace.*.channel_namespace_arn, [""]), 0)
}
