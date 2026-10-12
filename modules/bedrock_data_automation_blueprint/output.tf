output "bedrock_blueprint_id" {
  description = "Bedrock blueprint id"
  value       = element(concat(awscc_bedrock_blueprint.bedrock_blueprint.*.id, [""]), 0)
}
output "bedrock_blueprint_arn" {
  description = "Bedrock blueprint arn"
  value       = element(concat(awscc_bedrock_blueprint.bedrock_blueprint.*.blueprint_arn, [""]), 0)
}
output "bedrock_blueprint_blueprint_stage" {
  description = "Bedrock blueprint stage"
  value       = element(concat(awscc_bedrock_blueprint.bedrock_blueprint.*.blueprint_stage, [""]), 0)
}
output "bedrock_blueprint_creation_time" {
  description = "Bedrock blueprint creation time"
  value       = element(concat(awscc_bedrock_blueprint.bedrock_blueprint.*.creation_time, [""]), 0)
}
output "bedrock_blueprint_last_modified_time" {
  description = "Bedrock blueprint last modified time  "
  value       = element(concat(awscc_bedrock_blueprint.bedrock_blueprint.*.last_modified_time, [""]), 0)
}
