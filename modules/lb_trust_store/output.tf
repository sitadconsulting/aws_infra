output "lb_trust_store_arn_suffix" {
  description = "ARN suffix for use with CloudWatch Metrics"
  value       = element(concat(aws_lb_trust_store.lb_trust_store.*.arn_suffix, [""]), 0)
}
output "lb_trust_store_arn" {
  description = "ARN of the Trust Store (matches id)"
  value       = element(concat(aws_lb_trust_store.lb_trust_store.*.arn, [""]), 0)
}
output "lb_trust_store_arn_id" {
  description = "ARN of the Trust Store (matches arn)"
  value       = element(concat(aws_lb_trust_store.lb_trust_store.*.id, [""]), 0)
}
output "lb_trust_store_name" {
  description = "Name of the Trust Store"
  value       = element(concat(aws_lb_trust_store.lb_trust_store.*.name, [""]), 0)
}
