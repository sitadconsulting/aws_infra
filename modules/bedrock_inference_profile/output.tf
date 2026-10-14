output "bedrock_inference_profile_arn" {
  description = "ARN of the inference profile"
  value       = element(concat(aws_bedrock_inference_profile.bedrock_inference_profile.*.arn, [""]), 0)
}
output "bedrock_inference_profile_created_at" {
  description = "Time at which the inference profile was created"
  value       = element(concat(aws_bedrock_inference_profile.bedrock_inference_profile.*.created_at, [""]), 0)
}
output "bedrock_inference_profile_id" {
  description = "Unique identifier of the inference profile"
  value       = element(concat(aws_bedrock_inference_profile.bedrock_inference_profile.*.id, [""]), 0)
}
output "bedrock_inference_profile_models" {
  description = "List of information about each model in the inference profile"
  value       = element(concat(aws_bedrock_inference_profile.bedrock_inference_profile.*.models, [""]), 0)
}
output "bedrock_inference_profile_status" {
  description = "Status of the inference profile. ACTIVE means that the inference profile is available to use"
  value       = element(concat(aws_bedrock_inference_profile.bedrock_inference_profile.*.status, [""]), 0)
}
output "bedrock_inference_profile_type" {
  description = "Type of the inference profile. SYSTEM_DEFINED means that the inference profile is defined by Amazon Bedrock. APPLICATION means that the inference profile is defined by the user"
  value       = element(concat(aws_bedrock_inference_profile.bedrock_inference_profile.*.type, [""]), 0)
}
output "bedrock_inference_profile_updated_at" {
  description = "Time at which the inference profile was last updated"
  value       = element(concat(aws_bedrock_inference_profile.bedrock_inference_profile.*.updated_at, [""]), 0)
}
