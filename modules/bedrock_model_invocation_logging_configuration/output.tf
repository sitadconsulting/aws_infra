output "bedrock_model_invocation_logging_configuration_id" {
  description = "AWS region Logging ID"
  value       = element(concat(aws_bedrock_model_invocation_logging_configuration.bedrock_model_invocation_logging_configuration.*.id, [""]), 0)
}
