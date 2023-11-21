output "sagemaker_project_arn" {
  description = "ARN assigned by AWS to this Project"
  value       = element(concat(aws_sagemaker_project.sagemaker_project.*.arn, [""]), 0)
}
output "sagemaker_project_id" {
  description = "Project name"
  value       = element(concat(aws_sagemaker_project.sagemaker_project.*.id, [""]), 0)
}
output "sagemaker_project_project_id" {
  description = "Project ID"
  value       = element(concat(aws_sagemaker_project.sagemaker_project.*.project_id, [""]), 0)
}
