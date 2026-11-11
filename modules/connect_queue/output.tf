output "connect_queue_arn" {
  description = "ARN of the Queue"
  value       = element(concat(aws_connect_queue.connect_queue.*.arn, [""]), 0)
}
output "connect_queue_queue_id" {
  description = "The identifier for the Queue"
  value       = element(concat(aws_connect_queue.connect_queue.*.queue_id, [""]), 0)
}
output "connect_queue_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the Queue separated by a colon (:)"
  value       = element(concat(aws_connect_queue.connect_queue.*.id, [""]), 0)
}
