output "lambdaweb_function_endpoint_revision_id" {
  description = "Opaque revision identifier for the policy. The service returns a new value on every write; it is used for optimistic concurrency on update and delete"
  value       = element(concat(aws_lambdaweb_resource_policy.lambdaweb_resource_policy.*.revision_id, [""]), 0)
}
