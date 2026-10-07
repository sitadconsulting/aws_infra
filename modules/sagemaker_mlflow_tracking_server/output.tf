output "sagemaker_mlflow_tracking_server_arn" {
  description = "MLFlow Tracking Server ARN"
  value       = element(concat(aws_sagemaker_mlflow_tracking_server.sagemaker_mlflow_tracking_server.*.arn, [""]), 0)
}
output "sagemaker_mlflow_tracking_server_id" {
  description = "MLFlow Tracking Server ARN"
  value       = element(concat(aws_sagemaker_mlflow_tracking_server.sagemaker_mlflow_tracking_server.*.id, [""]), 0)
}
output "sagemaker_mlflow_tracking_server_url" {
  description = "MLFlow Tracking Server URL"
  value       = element(concat(aws_sagemaker_mlflow_tracking_server.sagemaker_mlflow_tracking_server.*.tracking_server_url, [""]), 0)
}
