output "sagemaker_notebook_instance_id" {
  description = "The name of the notebook instance"
  value       = element(concat(aws_sagemaker_notebook_instance.sagemaker_notebook_instance.*.id, [""]), 0)
}
output "sagemaker_notebook_instance_arn" {
  description = "ARN ssigned by AWS to this notebook instance"
  value       = element(concat(aws_sagemaker_notebook_instance.sagemaker_notebook_instance.*.arn, [""]), 0)
}
output "sagemaker_notebook_instance_url" {
  description = "The URL that you use to connect to the Jupyter notebook that is running in your notebook instance"
  value       = element(concat(aws_sagemaker_notebook_instance.sagemaker_notebook_instance.*.url, [""]), 0)
}
output "sagemaker_notebook_instance_network_interface_id" {
  description = "The network interface ID that Amazon SageMaker created at the time of creating the instance. Only available when setting subnet_id"
  value       = element(concat(aws_sagemaker_notebook_instance.sagemaker_notebook_instance.*.network_interface_id, [""]), 0)
}
