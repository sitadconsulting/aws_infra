output "bedrock_custom_model_custom_model_arn" {
  description = "ARN of custom Model"
  value       = element(concat(aws_bedrock_custom_model.bedrock_custom_model.*.custom_model_arn, [""]), 0)
}
output "bedrock_custom_model_job_arn" {
  description = "The ARN of the customization job"
  value       = element(concat(aws_bedrock_custom_model.bedrock_custom_model.*.job_arn, [""]), 0)
}
output "bedrock_custom_model_custom_job_status" {
  description = "The status of the customization job. A successful job transitions from InProgress to Completed when the output model is ready to use"
  value       = element(concat(aws_bedrock_custom_model.bedrock_custom_model.*.job_status, [""]), 0)
}
output "bedrock_custom_model_custom_training_metrics" {
  description = "Metrics associated with the customization job"
  value       = element(concat(aws_bedrock_custom_model.bedrock_custom_model.*.training_metrics, [""]), 0)
}
output "bedrock_custom_model_custom_validation_metrics" {
  description = "The loss metric for each validator that you provided"
  value       = element(concat(aws_bedrock_custom_model.bedrock_custom_model.*.validation_metrics, [""]), 0)
}
