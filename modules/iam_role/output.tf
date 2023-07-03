output "iam_role_name" {
  description = "The name of the role."
  value       = element(concat(aws_iam_role.iam_role.*.name, [""]), 0)
}
output "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = element(concat(aws_iam_role.iam_role.*.arn, [""]), 0)
}
output "iam_role_id" {
  description = "The name of the role."
  value       = element(concat(aws_iam_role.iam_role.*.id, [""]), 0)
}
