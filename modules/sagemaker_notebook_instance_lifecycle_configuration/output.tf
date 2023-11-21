output "sagemaker_notebook_instance_lifecycle_configuration_arn" {
  description = "ARN assigned by AWS to this lifecycle configuration"
  value       = element(concat(aws_sagemaker_notebook_instance_lifecycle_configuration.sagemaker_notebook_instance_lifecycle_configuration.*.arn, [""]), 0)
}
