output "prometheus_resource_policy_policy_status" {
  description = "The current status of the resource-based policy. Can be CREATING, ACTIVE, UPDATING, or DELETING"
  value       = element(concat(aws_prometheus_resource_policy.prometheus_resource_policy.*.policy_status, [""]), 0)
}
output "prometheus_resource_policy_revision_id" {
  description = "The revision ID of the current resource-based policy"
  value       = element(concat(aws_prometheus_resource_policy.prometheus_resource_policy.*.revision_id, [""]), 0)
}
