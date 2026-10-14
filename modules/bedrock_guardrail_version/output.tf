output "bedrock_guardrail_version_version" {
  description = "Guardrail version"
  value       = element(concat(aws_bedrock_guardrail_version.bedrock_guardrail_version.*.version, [""]), 0)
}
