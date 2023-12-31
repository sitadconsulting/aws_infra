output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = element(concat(aws_sqs_queue.sqs_queue.*.id, [""]), 0)
}
output "sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = element(concat(aws_sqs_queue.sqs_queue.*.arn, [""]), 0)
}
output "sqs_queue_url" {
  description = "Same as id: The URL for the created Amazon SQS queue"
  value       = element(concat(aws_sqs_queue.sqs_queue.*.url, [""]), 0)
}
