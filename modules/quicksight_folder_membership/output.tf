output "quicksight_folder_membership_id" {
  description = "A comma-delimited string joining AWS account ID, folder ID, member type, and member ID"
  value       = element(concat(aws_quicksight_folder_membership.quicksight_folder_membership.*.id, [""]), 0)
}
