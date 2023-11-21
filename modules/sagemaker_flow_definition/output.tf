output "sagemaker_flow_definition_arn" {
  description = "ARN assigned by AWS to this Flow Definition"
  value       = element(concat(aws_sagemaker_flow_definition.sagemaker_flow_definition.*.arn, [""]), 0)
}
output "sagemaker_flow_definition_id" {
  description = "The name of the Flow Definition"
  value       = element(concat(aws_sagemaker_flow_definition.sagemaker_flow_definition.*.id, [""]), 0)
}
