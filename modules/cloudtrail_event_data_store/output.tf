output "cloudtrail_event_data_store_arn" {
  description = "ARN of the event data store"
  value       = element(concat(aws_cloudtrail_event_data_store.cloudtrail_event_data_store.*.arn, [""]), 0)
}
output "cloudtrail_event_data_store_id" {
  description = "Name of the event data store"
  value       = element(concat(aws_cloudtrail_event_data_store.cloudtrail_event_data_store.*.id, [""]), 0)
}
