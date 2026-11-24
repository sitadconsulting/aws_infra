output "iot_topic_rule_arn" {
  description = "The ARN of the topic rule"
  value       = element(concat(aws_iot_topic_rule.iot_topic_rule.*.arn, [""]), 0)
}
output "iot_topic_rule_id" {
  description = "The name of the topic rule"
  value       = element(concat(aws_iot_topic_rule.iot_topic_rule.*.id, [""]), 0)
}
