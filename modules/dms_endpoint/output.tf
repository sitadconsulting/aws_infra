output "dms_endpoint_arn" {
  description = "ARN for the endpoint"
  value       = element(concat(aws_dms_endpoint.dms_endpoint.*.arn, [""]), 0)
}
