output "quicksight_folder_arn" {
  description = "ARN of the folder"
  value       = element(concat(aws_quicksight_folder.quicksight_folder.*.arn, [""]), 0)
}
output "quicksight_folder_create_time" {
  description = "The time that the folder was created"
  value       = element(concat(aws_quicksight_folder.quicksight_folder.*.create_time, [""]), 0)
}
output "quicksight_folder_folder_path" {
  description = "An array of ancestor ARN strings for the folder. Empty for root-level folders"
  value       = element(concat(aws_quicksight_folder.quicksight_folder.*.folder_path, [""]), 0)
}
output "quicksight_folder_id" {
  description = "A comma-delimited string joining AWS account ID and folder ID"
  value       = element(concat(aws_quicksight_folder.quicksight_folder.*.id, [""]), 0)
}
output "quicksight_folder_last_updated_time" {
  description = "The time that the folder was last updated"
  value       = element(concat(aws_quicksight_folder.quicksight_folder.*.last_updated_time, [""]), 0)
}
