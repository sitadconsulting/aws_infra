output "efs_access_point_arn" {
  description = "Access point ARN"
  value       = element(concat(aws_efs_access_point.efs_access_point.*.arn, [""]), 0)
}
output "efs_access_point_file_system_arn" {
  description = "Filesystem ARN"
  value       = element(concat(aws_efs_access_point.efs_access_point.*.file_system_arn, [""]), 0)
}
output "efs_access_point_id" {
  description = "Access point ID"
  value       = element(concat(aws_efs_access_point.efs_access_point.*.id, [""]), 0)
}
