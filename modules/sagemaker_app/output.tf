output "sagemaker_app_id" {
  description = "App ARN"
  value       = element(concat(aws_sagemaker_app.sagemaker_app.*.id, [""]), 0)
}
output "sagemaker_app_arn" {
  description = "App ARN"
  value       = element(concat(aws_sagemaker_app.sagemaker_app.*.arn, [""]), 0)
}
