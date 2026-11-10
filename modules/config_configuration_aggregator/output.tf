output "config_configuration_aggregator_arn" {
  description = "The ARN of the aggregator"
  value       = element(concat(aws_config_configuration_aggregator.config_configuration_aggregator.*.arn, [""]), 0)
}
