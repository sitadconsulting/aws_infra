output "sagemaker_code_repository_id" {
  description = "The name of the Code Repository"
  value       = element(concat(aws_sagemaker_code_repository.sagemaker_code_repository.*.id, [""]), 0)
}
output "sagemaker_code_repository_arn" {
  description = "ARN assigned by AWS to this Code Repository"
  value       = element(concat(aws_sagemaker_code_repository.sagemaker_code_repository.*.arn, [""]), 0)
}
