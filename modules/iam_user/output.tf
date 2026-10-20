output "iam_user_arne" {
  description = "The ARN assigned by AWS for this user"
  value       = element(concat(aws_iam_user.iam_user.*.arn, [""]), 0)
}
output "iam_user_id" {
  description = "The user's name"
  value       = element(concat(aws_iam_user.iam_user.*.id, [""]), 0)
}
output "iam_user_name" {
  description = "The user's name"
  value       = element(concat(aws_iam_user.iam_user.*.name, [""]), 0)
}
output "iam_user_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = element(concat(aws_iam_user.iam_user.*.unique_id, [""]), 0)
}
