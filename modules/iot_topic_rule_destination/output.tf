output "iot_topic_rule_destination_arn" {
  description = "The ARN of the topic rule destination"
  value       = element(concat(aws_iot_topic_rule_destination.iot_topic_rule_destination.*.arn, [""]), 0)
}
