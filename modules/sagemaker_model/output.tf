output "sagemaker_model_name" {
  description = "The name of the model"
  value       = element(concat(aws_sagemaker_model.sagemaker_model.*.name, [""]), 0)
}
output "sagemaker_model_arn" {
  description = "ARN assigned by AWS to this model"
  value       = element(concat(aws_sagemaker_model.sagemaker_model.*.arn, [""]), 0)
}
