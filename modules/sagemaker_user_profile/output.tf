output "sagemaker_user_profile_arn" {
  description = "ARN of user profile"
  value       = element(concat(aws_sagemaker_user_profile.sagemaker_user_profile.*.arn, [""]), 0)
}
output "sagemaker_user_profile_id" {
  description = "ARN of user profile"
  value       = element(concat(aws_sagemaker_user_profile.sagemaker_user_profile.*.id, [""]), 0)
}
output "sagemaker_user_profile_home_efs_file_system_uid" {
  description = "The ID of the user's profile in the Amazon Elastic File System (EFS) volume"
  value       = element(concat(aws_sagemaker_user_profile.sagemaker_user_profile.*.home_efs_file_system_uid, [""]), 0)
}
