output "launch_template_id" {
  description = "ID of this launch template"
  value       = element(concat(aws_launch_template.launch_template.*.id, [""]), 0)
}
output "launch_template_arn" {
  description = "ARN of this launch template"
  value       = element(concat(aws_launch_template.launch_template.*.arn, [""]), 0)
}
output "launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = element(concat(aws_launch_template.launch_template.*.latest_version, [""]), 0)
}
