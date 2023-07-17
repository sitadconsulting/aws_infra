output "lambda_event_source_mapping_function_arn" {
  description = "ARN of the Lambda function the event source mapping is sending events to"
  value       = element(concat(aws_lambda_event_source_mapping.lambda_event_source_mapping.*.arn, [""]), 0)
}
output "lambda_event_source_mapping_last_modified" {
  description = "The date this resource was last modified"
  value       = element(concat(aws_lambda_event_source_mapping.lambda_event_source_mapping.*.last_modified, [""]), 0)
}
output "lambda_event_source_mapping_last_processing_result" {
  description = "The result of the last AWS Lambda invocation of your Lambda function"
  value       = element(concat(aws_lambda_event_source_mapping.lambda_event_source_mapping.*.last_processing_result, [""]), 0)
}
output "lambda_event_source_mapping_state" {
  description = "The state of the event source mapping"
  value       = element(concat(aws_lambda_event_source_mapping.lambda_event_source_mapping.*.state, [""]), 0)
}
output "lambda_event_source_mapping_state_transition_reason" {
  description = "The reason the event source mapping is in its current state"
  value       = element(concat(aws_lambda_event_source_mapping.lambda_event_source_mapping.*.state_transition_reason, [""]), 0)
}
output "lambda_event_source_mapping_uuid" {
  description = "The UUID of the created event source mapping"
  value       = element(concat(aws_lambda_event_source_mapping.lambda_event_source_mapping.*.uuid, [""]), 0)
}
