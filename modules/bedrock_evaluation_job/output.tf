output "bedrock_evaluation_job_created_at" {
  description = "Date and time the evaluation job was created"
  value       = element(concat(aws_bedrock_evaluation_job.bedrock_evaluation_job.*.created_at, [""]), 0)
}
output "bedrock_evaluation_job_failure_messages" {
  description = "List of reasons the evaluation job failed to create, if applicable"
  value       = element(concat(aws_bedrock_evaluation_job.bedrock_evaluation_job.*.failure_messages, [""]), 0)
}
output "bedrock_evaluation_job_job_arn" {
  description = "ARN of the evaluation job"
  value       = element(concat(aws_bedrock_evaluation_job.bedrock_evaluation_job.*.job_arn, [""]), 0)
}
output "bedrock_evaluation_job_job_type" {
  description = "Whether the evaluation job is automated or human-based"
  value       = element(concat(aws_bedrock_evaluation_job.bedrock_evaluation_job.*.job_type, [""]), 0)
}
output "bedrock_evaluation_job_last_modified_time" {
  description = "Date and time the evaluation job was last modified"
  value       = element(concat(aws_bedrock_evaluation_job.bedrock_evaluation_job.*.last_modified_time, [""]), 0)
}
output "bedrock_evaluation_job_status" {
  description = "Current status of the evaluation job"
  value       = element(concat(aws_bedrock_evaluation_job.bedrock_evaluation_job.*.status, [""]), 0)
}
