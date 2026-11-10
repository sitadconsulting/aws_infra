output "connect_hours_of_operation_arn" {
  description = "ARN of the Hours of Operation"
  value       = element(concat(aws_connect_hours_of_operation.connect_hours_of_operation.*.arn, [""]), 0)
}
output "connect_hours_of_operation_hours_of_operation_id" {
  description = "The identifier for the hours of operation".
  value       = element(concat(aws_connect_hours_of_operation.connect_hours_of_operation.*.hours_of_operation_id, [""]), 0)
}
output "connect_hours_of_operation_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the Hours of Operation separated by a colon (:)"
  value       = element(concat(aws_connect_hours_of_operation.connect_hours_of_operation.*.id, [""]), 0)
}
