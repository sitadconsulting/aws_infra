output "s3files_file_system_arn" {
  description = "ARN of the file system"
  value       = element(concat(aws_s3files_file_system.s3files_file_system.*.arn, [""]), 0)
}
output "s3files_file_system_creation_time" {
  description = "Creation time"
  value       = element(concat(aws_s3files_file_system.s3files_file_system.*.creation_time, [""]), 0)
}
output "s3files_file_system_id" {
  description = "Identifier of the file system"
  value       = element(concat(aws_s3files_file_system.s3files_file_system.*.id, [""]), 0)
}
output "s3files_file_system_name" {
  description = "File system name"
  value       = element(concat(aws_s3files_file_system.s3files_file_system.*.name, [""]), 0)
}
output "s3files_file_system_owner_id" {
  description = "AWS account ID of the owner"
  value       = element(concat(aws_s3files_file_system.s3files_file_system.*.owner_id, [""]), 0)
}
output "s3files_file_system_status" {
  description = "File system status"
  value       = element(concat(aws_s3files_file_system.s3files_file_system.*.status, [""]), 0)
}
output "s3files_file_system_status_message" {
  description = "Status message"
  value       = element(concat(aws_s3files_file_system.s3files_file_system.*.status_message, [""]), 0)
}
