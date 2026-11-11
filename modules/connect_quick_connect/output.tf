output "connect_quick_connect_arn" {
  description = "ARN of the Quick Connect"
  value       = element(concat(aws_connect_quick_connect.connect_quick_connect.*.arn, [""]), 0)
}
output "connect_quick_connect_quick_connect_id" {
  description = "The identifier for the Quick Connect"
  value       = element(concat(aws_connect_quick_connect.connect_quick_connect.*.quick_connect_id, [""]), 0)
}
output "connect_quick_connect_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the Quick Connect separated by a colon (:)"
  value       = element(concat(aws_connect_quick_connect.connect_quick_connect.*.id, [""]), 0)
}
