output "synthetics_group_arn" {
  description = "ARN of the Group"
  value       = element(concat(aws_synthetics_group.synthetics_group.*.arn, [""]), 0)
}
output "synthetics_group_group_id" {
  description = "ID of the Group"
  value       = element(concat(aws_synthetics_group.synthetics_group.*.group_id, [""]), 0)
}
