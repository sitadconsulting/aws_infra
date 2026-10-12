output "sagemaker_processing_job_auto_ml_job_arn" {
  description = "The ARN of an AutoML job associated with this processing job"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.auto_ml_job_arn, [""]), 0)
}
output "sagemaker_processing_job_creation_time" {
  description = "The time at which the processing job was created"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.creation_time, [""]), 0)
}
output "sagemaker_processing_job_exit_message" {
  description = "An optional string, up to one KB in size, that contains metadata from the processing container when the processing job exits"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.exit_message, [""]), 0)
}
output "sagemaker_processing_job_failure_reason" {
  description = "A string, up to one KB in size, that contains the reason a processing job failed, if it failed"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.failure_reason, [""]), 0)
}
output "sagemaker_processing_job_monitoring_schedule_arn" {
  description = "The ARN of a monitoring schedule for an endpoint associated with this processing job"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.monitoring_schedule_arn, [""]), 0)
}
output "sagemaker_processing_job_processing_end_time" {
  description = "The time at which the processing job completed"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.processing_end_time, [""]), 0)
}
output "sagemaker_processing_job_processing_job_arn" {
  description = "The Amazon Resource Name (ARN) of the processing job"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.processing_job_arn, [""]), 0)
}
output "sagemaker_processing_job_processing_job_status" {
  description = "Provides the status of a processing job"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.processing_job_status, [""]), 0)
}
output "sagemaker_processing_job_processing_start_time" {
  description = "The time at which the processing job started"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.processing_start_time, [""]), 0)
}
output "sagemaker_processing_job_training_job_arn" {
  description = "The ARN of a training job associated with this processing job"
  value       = element(concat(awscc_sagemaker_processing_job.sagemaker_processing_job.*.training_job_arn, [""]), 0)
}
