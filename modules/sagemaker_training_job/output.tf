output "sagemaker_training_job_arn" {
  description = "Training Job ARN"
  value       = element(concat(aws_sagemaker_training_job.sagemaker_training_job.*.arn, [""]), 0)
}
