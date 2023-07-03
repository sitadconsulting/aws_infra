output "security_group_id" {
  description = "ID of the security group"
  value       = element(concat(aws_security_group.security_group.*.id, [""]), 0)
}
output "security_group_arn" {
  description = "ARN of the security group"
  value       = element(concat(aws_security_group.security_group.*.arn, [""]), 0)
}

