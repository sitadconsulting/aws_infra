output "cloudwatch_event_archive_arn" {
  description = "ARN of the archive"
  value       = element(concat(aws_cloudwatch_event_archive.cloudwatch_event_archive.*.arn, [""]), 0)
}
