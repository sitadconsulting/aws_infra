output "quicksight_data_set_arn" {
  description = "ARN of the data set"
  value       = element(concat(aws_quicksight_data_set.quicksight_data_set.*.arn, [""]), 0)
}
output "quicksight_data_set_id" {
  description = "A comma-delimited string joining AWS account ID and data set ID"
  value       = element(concat(aws_quicksight_data_set.quicksight_data_set.*.id, [""]), 0)
}
