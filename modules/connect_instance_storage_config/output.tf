output "connect_instance_storage_config_association_id" {
  description = "The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID" 
  value       = element(concat(aws_connect_instance_storage_config.connect_instance_storage_config.*.association_id, [""]), 0)
}
output "connect_instance_storage_config_id" {
  description = "The identifier of the hosting Amazon Connect Instance, association_id, and resource_type separated by a colon (:)"
  value       = element(concat(aws_connect_instance_storage_config.connect_instance_storage_config.*.id, [""]), 0)
}
