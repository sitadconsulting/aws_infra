output "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = element(concat(aws_iam_role.iam_role.*.arn, [""]), 0)
}
output "iam_role_create_date" {
  description = "Creation date of the IAM role"
  value       = element(concat(aws_iam_role.iam_role.*.create_date, [""]), 0)
}
output "iam_role_id" {
  description = "Name of the role"
  value       = element(concat(aws_iam_role.iam_role.*.id, [""]), 0)
}
output "iam_role_name" {
  description = "Name of the role"
  value       = element(concat(aws_iam_role.iam_role.*.name, [""]), 0)
}
output "iam_role_unique_id" {
  description = "Stable and unique string identifying the role"
  value       = element(concat(aws_iam_role.iam_role.*.unique_id, [""]), 0)
}
