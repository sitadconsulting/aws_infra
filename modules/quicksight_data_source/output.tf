output "quicksight_data_source_arn" {
  description = "ARN of the data source"
  value       = element(concat(aws_quicksight_data_source.quicksight_data_source.*.arn, [""]), 0)
}
