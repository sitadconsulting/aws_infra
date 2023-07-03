output "iam_group_arn" {
  description = "The ARN assigned by AWS for this group"
  value       = element(concat(aws_iam_group.iam_group.*.arn, [""]), 0)
}
output "iam_group_name" {
  description = "The group's name"
  value       = element(concat(aws_iam_group.iam_group.*.name, [""]), 0)
}
output "iam_group_id" {
  description = "The group's id"
  value       = element(concat(aws_iam_group.iam_group.*.id, [""]), 0)
}
output "iam_group_path" {
  description = "The group's path"
  value       = element(concat(aws_iam_group.iam_group.*.path, [""]), 0)
}
