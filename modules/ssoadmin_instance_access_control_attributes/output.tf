output "ssoadmin_instance_access_control_attributes_id" {
  description = "The identifier of the Instance Access Control Attribute instance_arn"
  value       = element(concat(aws_ssoadmin_instance_access_control_attributes.ssoadmin_instance_access_control_attributes.*.id, [""]), 0)
}
