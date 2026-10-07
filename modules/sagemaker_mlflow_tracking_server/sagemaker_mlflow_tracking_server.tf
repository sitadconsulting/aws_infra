resource "aws_sagemaker_mlflow_tracking_server" "sagemaker_mlflow_tracking_server" {
  artifact_store_uri              = var.sagemaker_mlflow_tracking_server_artifact_store_uri
  role_arn                        = var.sagemaker_mlflow_tracking_server_role_arn
  tracking_server_name            = var.sagemaker_mlflow_tracking_server_tracking_server_name
  mlflow_version                  = var.sagemaker_mlflow_tracking_server_mlflow_version
  automatic_model_registration    = var.sagemaker_mlflow_tracking_server_automatic_model_registration
  tracking_server_size            = var.sagemaker_mlflow_tracking_server_tracking_server_size
  weekly_maintenance_window_start = var.sagemaker_mlflow_tracking_server_weekly_maintenance_window_start
  tags                            = var.sagemaker_mlflow_tracking_server_tags
}
