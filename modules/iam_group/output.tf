output "iam_group_arn" {
  description = "ARN assigned by AWS for this group"
  value       = element(concat(aws_iam_group.iam_group.*.arn, [""]), 0)
}
output "iam_group_id" {
  description = "Group's name"
  value       = element(concat(aws_iam_group.iam_group.*.id, [""]), 0)
}
output "iam_group_name" {
  description = "Group's name"
  value       = element(concat(aws_iam_group.iam_group.*.name, [""]), 0)
}
output "iam_group_path" {
  description = "Path of the group in IAM"
  value       = element(concat(aws_iam_group.iam_group.*.path, [""]), 0)
}
output "iam_group_unique_id" {
  description = "Unique ID assigned by AWS"
  value       = element(concat(aws_iam_group.iam_group.*.unique_id, [""]), 0)
}
