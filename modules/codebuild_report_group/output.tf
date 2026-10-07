output "codebuild_report_group_id" {
  description = "The ARN of Report Group"
  value       = element(concat(aws_codebuild_report_group.codebuild_report_group.*.id, [""]), 0)
}
output "codebuild_report_group_arn" {
  description = "The ARN of Report Group"
  value       = element(concat(aws_codebuild_report_group.codebuild_report_group.*.arn, [""]), 0)
}
output "codebuild_report_group_created" {
  description = "The date and time this Report Group was created"
  value       = element(concat(aws_codebuild_report_group.codebuild_report_group.*.created, [""]), 0)
}
