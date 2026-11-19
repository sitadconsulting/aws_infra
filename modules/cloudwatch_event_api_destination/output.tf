output "cloudwatch_event_api_destination_arn" {
  description = "ARN of the event API Destination"
  value       = element(concat(aws_cloudwatch_event_api_destination.cloudwatch_event_api_destination.*.arn, [""]), 0)
}
