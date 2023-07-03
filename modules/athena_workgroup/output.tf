output "athena_workgroup_arn" {
  description = "ARN of the workgroup"
  value       = element(concat(aws_athena_workgroup.athena_workgroup.*.arn, [""]), 0)
}
output "athena_workgroup_configuration" {
  description = "Workgroup configuration settings"
  value       = element(concat(aws_athena_workgroup.athena_workgroup.*.configuration, [""]), 0)
}
output "athena_workgroup_id" {
  description = "Workgroup name"
  value       = element(concat(aws_athena_workgroup.athena_workgroup.*.id, [""]), 0)
}
