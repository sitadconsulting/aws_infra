output "s3files_access_point_arn" {
  description = "ARN of the access point"
  value       = element(concat(aws_s3files_access_point.s3files_access_point.*.arn, [""]), 0)
}
output "s3files_access_point_id" {
  description = "Identifier of the access point"
  value       = element(concat(aws_s3files_access_point.s3files_access_point.*.id, [""]), 0)
}
output "s3files_access_point_name" {
  description = "Access point name"
  value       = element(concat(aws_s3files_access_point.s3files_access_point.*.name, [""]), 0)
}
output "s3files_access_point_owner_id" {
  description = "AWS account ID of the owner"
  value       = element(concat(aws_s3files_access_point.s3files_access_point.*.owner_id, [""]), 0)
}
output "s3files_access_point_status" {
  description = "Access point status"
  value       = element(concat(aws_s3files_access_point.s3files_access_point.*.status, [""]), 0)
}
