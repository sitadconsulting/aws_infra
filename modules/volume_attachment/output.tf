output "volume_attachment_device_name" {
  description = "Device name exposed to the instance"
  value       = element(concat(aws_volume_attachment.volume_attachment.*.device_name, [""]), 0)
}
output "volume_attachment_instance_id" {
  description = "ID of the Instance"
  value       = element(concat(aws_volume_attachment.volume_attachment.*.instance_id, [""]), 0)
}
output "volume_attachment_volume_id" {
  description = "ID of the Volume"
  value       = element(concat(aws_volume_attachment.volume_attachment.*.volume_id, [""]), 0)
}
