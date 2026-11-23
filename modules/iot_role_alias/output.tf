output "iot_role_alias_arn" {
  description = "The ARN assigned by AWS to this role alias"
  value       = element(concat(aws_iot_role_alias.iot_role_alias.*.arn, [""]), 0)
}
