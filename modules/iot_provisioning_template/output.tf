output "iot_provisioning_template_arn" {
  description = "The ARN that identifies the provisioning template"
  value       = element(concat(aws_iot_provisioning_template.iot_provisioning_template.*.arn, [""]), 0)
}
output "iot_provisioning_template_default_version_id" {
  description = "The default version of the fleet provisioning template"
  value       = element(concat(aws_iot_provisioning_template.iot_provisioning_template.*.default_version_id, [""]), 0)
}
