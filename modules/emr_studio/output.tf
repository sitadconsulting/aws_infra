output "emr_studio_arn" {
  description = "ARN of the studio"
  value       = element(concat(aws_emr_studio.emr_studio.*.arn, [""]), 0)
}
output "emr_studio_url" {
  description = "The unique access URL of the Amazon EMR Studio"
  value       = element(concat(aws_emr_studio.emr_studio.*.url, [""]), 0)
}
