output "vpclattice_targetgroup_arn" {
  description = "ARN of the target group"
  value       = element(concat(aws_vpclattice_target_group.vpclattice_target_group.*.arn, [""]), 0)
}
output "vpclattice_targetgroup_id" {
  description = "Unique identifier for the target group"
  value       = element(concat(aws_vpclattice_target_group.vpclattice_target_group.*.id, [""]), 0)
}
output "vpclattice_targetgroup_status" {
  description = "Status of the target group"
  value       = element(concat(aws_vpclattice_target_group.vpclattice_target_group.*.status, [""]), 0)
}
