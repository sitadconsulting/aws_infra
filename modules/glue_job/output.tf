output "glue_job_arn" {
  description = "ARN of the Glue Job"
  value       = element(concat(aws_glue_job.glue_job.*.arn, [""]), 0)
}
output "glue_job_id" {
  description = "Glue Job Name"
  value       = element(concat(aws_glue_job.glue_job.*.id, [""]), 0)
}
