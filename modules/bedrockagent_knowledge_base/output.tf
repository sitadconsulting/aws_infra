output "bedrockagent_knowledge_base_arn" {
  description = "ARN of the knowledge base"
  value       = element(concat(aws_bedrockagent_knowledge_base.bedrockagent_knowledge_base.*.arn, [""]), 0)
}
output "bedrockagent_knowledge_base_created_at" {
  description = "Time at which the knowledge base was created"
  value       = element(concat(aws_bedrockagent_knowledge_base.bedrockagent_knowledge_base.*.created_at, [""]), 0)
}
output "bedrockagent_knowledge_base_failure_reasons" {
  description = "List of failure reasons reported when the knowledge base is in a failed state"
  value       = element(concat(aws_bedrockagent_knowledge_base.bedrockagent_knowledge_base.*.failure_reasons, [""]), 0)
}
output "bedrockagent_knowledge_base_id" {
  description = "Knowledge Base iD"
  value       = element(concat(aws_bedrockagent_knowledge_base.bedrockagent_knowledge_base.*.id, [""]), 0)
}
output "bedrockagent_knowledge_base_updated_at" {
  description = "Time at which the knowledge base was last updated"
  value       = element(concat(aws_bedrockagent_knowledge_base.bedrockagent_knowledge_base.*.updated_at, [""]), 0)
}
