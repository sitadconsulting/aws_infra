output "sagemaker_endpoint_arn" {
  description = "ARN assigned by AWS to this endpoint"
  value       = element(concat(aws_sagemaker_endpoint.sagemaker_endpoint.*.arn, [""]), 0)
}
output "sagemaker_endpoint_name" {
  description = "The name of the endpoint"
  value       = element(concat(aws_sagemaker_endpoint.sagemaker_endpoint.*.name, [""]), 0)
}
