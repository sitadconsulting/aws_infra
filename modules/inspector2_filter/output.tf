output "inspector2_filter_arn" {
  description = "ARN of the Filter"
  value       = element(concat(aws_inspector2_filter.inspector2_filter.*.arn, [""]), 0)
}
