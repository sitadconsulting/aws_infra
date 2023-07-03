output "iam_user_name" {
  description = "The user's name"
  value       = element(concat(aws_iam_user.iam_user.*.name, [""]), 0)
}
output "iam_user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = element(concat(aws_iam_user.iam_user.*.arn, [""]), 0)
}
