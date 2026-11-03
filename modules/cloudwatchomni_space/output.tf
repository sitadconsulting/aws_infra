output "cloudwatchomni_space_domain_arn" {
  description = "ARN of the domain the space belongs to"
  value       = element(concat(aws_cloudwatchomni_space.cloudwatchomni_space.*.domain_arn, [""]), 0)
}
output "cloudwatchomni_space_space_arn" {
  description = "ARN of the space"
  value       = element(concat(aws_cloudwatchomni_space.cloudwatchomni_space.*.space_arn, [""]), 0)
}
output "cloudwatchomni_space_space_id" {
  description = "Unique ID of the space"
  value       = element(concat(aws_cloudwatchomni_space.cloudwatchomni_space.*.space_id, [""]), 0)
}
output "cloudwatchomni_space_status" {
  description = "Status of the space"
  value       = element(concat(aws_cloudwatchomni_space.cloudwatchomni_space.*.status, [""]), 0)
}
