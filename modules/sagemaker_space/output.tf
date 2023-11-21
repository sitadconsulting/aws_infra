output "sagemaker_space_arn" {
  description = "ARN of the space"
  value       = element(concat(aws_sagemaker_space.sagemaker_space.*.arn, [""]), 0)
}
output "sagemaker_space_id" {
  description = "ARN of the space"
  value       = element(concat(aws_sagemaker_space.sagemaker_space.*.id, [""]), 0)
}
output "sagemaker_space_home_efs_file_system_uid" {
  description = "The ID of the space's profile in the Amazon Elastic File System volume"
  value       = element(concat(aws_sagemaker_space.sagemaker_space.*.home_efs_file_system_uid, [""]), 0)
}
