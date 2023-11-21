output "sagemaker_endpoint_configuration_arn" {
  description = "ARN assigned by AWS to this endpoint configuration"
  value       = element(concat(aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configuration.*.arn, [""]), 0)
}
output "sagemaker_endpoint_configuration_name" {
  description = "The name of the endpoint configuration"
  value       = element(concat(aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configuration.*.name, [""]), 0)
}
