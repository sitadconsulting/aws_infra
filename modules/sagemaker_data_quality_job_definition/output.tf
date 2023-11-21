output "sagemaker_data_quality_job_definition_arn" {
  description = "ARN assigned by AWS to this data quality job definition"
  value       = element(concat(aws_sagemaker_data_quality_job_definition.sagemaker_data_quality_job_definition.*.arn, [""]), 0)
}
output "sagemaker_data_quality_job_definition_name" {
  description = "The name of the data quality job definition"
  value       = element(concat(aws_sagemaker_data_quality_job_definition.sagemaker_data_quality_job_definition.*.name, [""]), 0)
}
