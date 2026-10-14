output "bedrock_model_invocation_job_end_time" {
  description = "Time at which the batch inference job ended"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.end_time, [""]), 0)
}
output "bedrock_model_invocation_job_error_record_count" {
  description = "Number of records that failed to process in the batch inference job"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.error_record_count, [""]), 0)
}
output "bedrock_model_invocation_job_job_arn" {
  description = "ARN of the batch inference job"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.job_arn, [""]), 0)
}
output "bedrock_model_invocation_job_job_expiration_time" {
  description = "Time at which the batch inference job times or timed out"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.job_expiration_time, [""]), 0)
}
output "bedrock_model_invocation_job_model_invocation_type" {
  description = "Invocation endpoint used for the batch inference job" 
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.model_invocation_type, [""]), 0)
}
output "bedrock_model_invocation_job_processed_record_count" {
  description = "Number of records that have been processed in the batch inference job"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.processed_record_count, [""]), 0)
}
output "bedrock_model_invocation_job_status" {
  description = "Status of the batch inference job"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.status, [""]), 0)
}
output "bedrock_model_invocation_job_submit_time" {
  description = "Time at which the batch inference job was submitted"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.submit_time, [""]), 0)
}
output "bedrock_model_invocation_job_success_record_count" {
  description = "Number of records that were successfully processed in the batch inference job"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.success_record_count, [""]), 0)
}
output "bedrock_model_invocation_job_total_record_count" {
  description = "Total number of records in the batch inference job"
  value       = element(concat(aws_bedrock_model_invocation_job.bedrock_model_invocation_job.*.total_record_count, [""]), 0)
}
