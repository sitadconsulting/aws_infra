output "bedrockagent_flow_arn" {
  description = "ARN of the flow"
  value       = element(concat(aws_bedrockagent_flow.bedrockagent_flow.*.arn, [""]), 0)
}
output "bedrockagent_flow_created_at" {
  description = "Time at which the flow was created"
  value       = element(concat(aws_bedrockagent_flow.bedrockagent_flow.*.created_at, [""]), 0)
}
output "bedrockagent_flow_id" {
  description = "Unique identifier of the flow"
  value       = element(concat(aws_bedrockagent_flow.bedrockagent_flow.*.id, [""]), 0)
}
output "bedrockagent_flow_status" {
  description = "Status of the flow"
  value       = element(concat(aws_bedrockagent_flow.bedrockagent_flow.*.status, [""]), 0)
}
output "bedrockagent_flow_updated_at" {
  description = "Time at which the flow was last updated"
  value       = element(concat(aws_bedrockagent_flow.bedrockagent_flow.*.updated_at, [""]), 0)
}
output "bedrockagent_flow_version" {
  description = "Version of the flow"
  value       = element(concat(aws_bedrockagent_flow.bedrockagent_flow.*.version, [""]), 0)
}
