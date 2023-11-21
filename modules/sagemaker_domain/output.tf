output "sagemaker_domain_id" {
  description = "Domain ID"
  value       = element(concat(aws_sagemaker_domain.sagemaker_domain.*.id, [""]), 0)
}
output "sagemaker_domain_arn" {
  description = "ARN assigned by AWS to this Domain"
  value       = element(concat(aws_sagemaker_domain.sagemaker_domain.*.arn, [""]), 0)
}
output "sagemaker_domain_url" {
  description = "Domain URL"
  value       = element(concat(aws_sagemaker_domain.sagemaker_domain.*.url, [""]), 0)
}
output "sagemaker_domain_single_sign_on_managed_application_instance_id" {
  description = "The SSO managed application instance ID"
  value       = element(concat(aws_sagemaker_domain.sagemaker_domain.*.single_sign_on_managed_application_instance_id, [""]), 0)
}
output "sagemaker_domain_security_group_id_for_domain_boundary" {
  description = "The ID of the security group that authorizes traffic between the RSessionGateway apps and the RStudioServerPro app"
  value       = element(concat(aws_sagemaker_domain.sagemaker_domain.*.security_group_id_for_domain_boundary, [""]), 0)
}
output "sagemaker_domain_home_efs_file_system_id" {
  description = "The ID of the Amazon Elastic File System (EFS) managed by this Domain"
  value       = element(concat(aws_sagemaker_domain.sagemaker_domain.*.home_efs_file_system_id, [""]), 0)
}
