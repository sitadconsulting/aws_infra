output "macie2_classification_job_created_at" {
  description = "Date and time, in UTC and extended RFC 3339 format, when the job was created"
  value       = element(concat(aws_macie2_classification_job.macie2_classification_job.*.created_at, [""]), 0)
}
