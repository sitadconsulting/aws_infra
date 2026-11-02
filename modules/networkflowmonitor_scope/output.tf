output "networkflowmonitor_scope_scope_arn" {
  description = "ARN of the scope"
  value       = element(concat(aws_networkflowmonitor_scope.networkflowmonitor_scope.*.scope_arn, [""]), 0)
}
output "networkflowmonitor_scope_scope_id" {
  description = "The identifier for the scope that includes the resources you want to get data results for"
  value       = element(concat(aws_networkflowmonitor_scope.networkflowmonitor_scope.*.scope_id, [""]), 0)
}
