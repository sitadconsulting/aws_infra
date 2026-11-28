output "macie2_findings_filter_arn" {
  description = "ARN of the Findings Filter"
  value       = element(concat(aws_macie2_findings_filter.macie2_findings_filter.*.arn, [""]), 0)
}
output "macie2_findings_filter_id" {
  description = "Unique identifier (ID) of the Macie Findings Filter"
  value       = element(concat(aws_macie2_findings_filter.macie2_findings_filter.*.id, [""]), 0)
}
