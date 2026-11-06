output "bcmdataexports_export_arn" {
  description = "ARN for this export"
  value       = element(concat(aws_bcmdataexports_export.bcmdataexports_export.*.arn, [""]), 0)
}
