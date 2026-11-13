output "dms_s3_endpoint_endpoint_arn" {
  description = "ARN for the endpoint"
  value       = element(concat(aws_dms_s3_endpoint.dms_s3_endpoint.*.endpoint_arn, [""]), 0)
}
output "dms_s3_endpoint_endpoint_engine_display_name" {
  description = "Expanded name for the engine name"
  value       = element(concat(aws_dms_s3_endpoint.dms_s3_endpoint.*.engine_display_name, [""]), 0)
}
output "dms_s3_endpoint_endpoint_external_id" {
  description = "Can be used for cross-account validation. Use it in another account with aws_dms_s3_endpoint to create the endpoint cross-account"
  value       = element(concat(aws_dms_s3_endpoint.dms_s3_endpoint.*.external_id, [""]), 0)
}
output "dms_s3_endpoint_endpoint_status" {
  description = "Status of the endpoint"
  value       = element(concat(aws_dms_s3_endpoint.dms_s3_endpoint.*.status, [""]), 0)
}
