output "emrcontainers_job_template_arn" {
  description = "ARN of the job template"
  value       = element(concat(aws_emrcontainers_job_template.emrcontainers_job_template.*.arn, [""]), 0)
}
output "emrcontainers_job_template_id" {
  description = "The ID of the job template"
  value       = element(concat(aws_emrcontainers_job_template.emrcontainers_job_template.*.id, [""]), 0)
}
