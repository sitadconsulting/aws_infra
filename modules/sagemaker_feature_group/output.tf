output "sagemaker_feature_group_arn" {
  description = "ARN assigned by AWS to this feature_group"
  value       = element(concat(aws_sagemaker_feature_group.sagemaker_feature_group.*.arn, [""]), 0)
}
output "sagemaker_feature_group_name" {
  description = "The name of the Feature Group"
  value       = element(concat(aws_sagemaker_feature_group.sagemaker_feature_group.*.name, [""]), 0)
}
