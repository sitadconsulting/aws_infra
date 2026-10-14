output "bedrock_guardrail_created_at" {
  description = "Unix epoch timestamp in seconds for when the Guardrail was created"
  value       = element(concat(aws_bedrock_guardrail.bedrock_guardrail.*.created_at, [""]), 0)
}
output "bedrock_guardrail_guardrail_arn" {
  description = "ARN of the Guardrail"
  value       = element(concat(aws_bedrock_guardrail.bedrock_guardrail.*.guardrail_arn, [""]), 0)
}
output "bedrock_guardrail_guardrail_id" {
  description = "ID of the Guardrail"
  value       = element(concat(aws_bedrock_guardrail.bedrock_guardrail.*.guardrail_id, [""]), 0)
}
output "bedrock_guardrail_status" {
  description = "Status of the Bedrock Guardrail. One of READY, FAILED"
  value       = element(concat(aws_bedrock_guardrail.bedrock_guardrail.*.status, [""]), 0)
}
output "bedrock_guardrail_updated_at" {
  description = "Date and time that the Guardrail list was last updated"
  value       = element(concat(aws_bedrock_guardrail.bedrock_guardrail.*.updated_at, [""]), 0)
}
output "bedrock_guardrail_version" {
  description = "Version of the Guardrail"
  value       = element(concat(aws_bedrock_guardrail.bedrock_guardrail.*.version, [""]), 0)
}
