output "launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = element(concat(aws_launch_configuration.launch_configuration.*.id, [""]), 0)
}
output "launch_configuration_arn" {
  description = "ARN of the launch configuration"
  value       = element(concat(aws_launch_configuration.launch_configuration.*.arn, [""]), 0)
}
output "launch_configuration_name" {
  description = "The name of the launch configuration"
  value       = element(concat(aws_launch_configuration.launch_configuration.*.name, [""]), 0)
}
