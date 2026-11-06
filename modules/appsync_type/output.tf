output "appsync_type_arn" {
  description = "Type ARN"
  value       = element(concat(aws_appsync_type.appsync_type.*.arn, [""]), 0)
}
output "appsync_type_description" {
  description = "Type description"
  value       = element(concat(aws_appsync_type.appsync_type.*.description, [""]), 0)
}
output "appsync_type_id" {
  description = "ID constructed from api-id:format:name"
  value       = element(concat(aws_appsync_type.appsync_type.*.id, [""]), 0)
}
output "appsync_type_name" {
  description = "Type name"
  value       = element(concat(aws_appsync_type.appsync_type.*.name, [""]), 0)
}
