output "bedrockagent_prompt_arn" {
  description = "ARN of the prompt"
  value       = element(concat(aws_bedrockagent_prompt.bedrockagent_prompt.*.arn, [""]), 0)
}
output "bedrockagent_prompt_created_at" {
  description = "Time at which the prompt was created"
  value       = element(concat(aws_bedrockagent_prompt.bedrockagent_prompt.*.created_at, [""]), 0)
}
output "bedrockagent_prompt_id" {
  description = "Unique identifier of the prompt"
  value       = element(concat(aws_bedrockagent_prompt.bedrockagent_prompt.*.id, [""]), 0)
}
output "bedrockagent_prompt_updated_at" {
  description = "Time at which the prompt was last updated"
  value       = element(concat(aws_bedrockagent_prompt.bedrockagent_prompt.*.updated_at, [""]), 0)
}
output "bedrockagent_prompt_version" {
  description = "Version of the prompt. When you create a prompt, the version created is the DRAFT version"
  value       = element(concat(aws_bedrockagent_prompt.bedrockagent_prompt.*.version, [""]), 0)
}
