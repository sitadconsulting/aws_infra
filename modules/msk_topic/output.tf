output "msk_topic_arn" {
  description = "ARN of the Topic"
  value       = element(concat(aws_msk_topic.msk_topic.*.arn, [""]), 0)
}
output "msk_topic_configs_actual" {
  description = "Aggregated Kafka configuration in JSON format for Topic, both explicit set values from configs and implicit set values (AWS default configuration, historically set values or manual configuration from outside Terraform)"
  value       = element(concat(aws_msk_topic.msk_topic.*.configs_actual, [""]), 0)
}
