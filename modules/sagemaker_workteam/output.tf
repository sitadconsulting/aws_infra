output "sagemaker_workteam_arn" {
  description = "ARN assigned by AWS to this Workteam"
  value       = element(concat(aws_sagemaker_workteam.sagemaker_workteam.*.arn, [""]), 0)
}
output "sagemaker_workteam_id" {
  description = "Workteam name"
  value       = element(concat(aws_sagemaker_workteam.sagemaker_workteam.*.id, [""]), 0)
}
output "sagemaker_workteam_subdomain" {
  description = "OIDC Identity Provider subdomain"
  value       = element(concat(aws_sagemaker_workteam.sagemaker_workteam.*.subdomain, [""]), 0)
}
