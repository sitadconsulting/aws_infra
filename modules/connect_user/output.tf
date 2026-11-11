output "connect_user_arn" {
  description = "ARN of the user"
  value       = element(concat(aws_connect_user.connect_user.*.arn, [""]), 0)
}
output "connect_user_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the user separated by a colon (:)"
  value       = element(concat(aws_connect_user.connect_user.*.id, [""]), 0)
}
output "connect_user_user_id" {
  description = "The identifier for the user"
  value       = element(concat(aws_connect_user.connect_user.*.user_id, [""]), 0)
}
