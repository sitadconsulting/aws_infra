variable "sagemaker_mlflow_tracking_server_artifact_store_uri" {
  description = "(Required) The S3 URI for a general purpose bucket to use as the MLflow Tracking Server artifact store"
  type        = string
}
variable "sagemaker_mlflow_tracking_server_role_arn" {
  description = "(Required) The Amazon Resource Name (ARN) for an IAM role in your account that the MLflow Tracking Server uses to access the artifact store in Amazon S3. The role should have AmazonS3FullAccess permissions."
  type        =  string
}
variable "sagemaker_mlflow_tracking_server_tracking_server_name" {
  description = "(Required) A unique string identifying the tracking server name. This string is part of the tracking server ARN"
  type        =  string
}
variable "sagemaker_mlflow_tracking_server_mlflow_version" {
  description = "(Optional) The version of MLflow that the tracking server uses. To see which MLflow versions are available to use"
  type        = string
  default     = null
}
variable "sagemaker_mlflow_tracking_server_automatic_model_registration" {
  description = "(Optional) Whether to automatically register a model with MLFlow Tracking Server"
  type        = bool
  default     = false
}
variable "sagemaker_mlflow_tracking_server_tracking_server_size" {
  description = "(Optional) The size of the tracking server you want to create. You can choose between \"Small\", \"Medium\", and \"Large\". The default MLflow Tracking Server configuration size is \"Small\". You can choose a size depending on the projected use of the tracking server such as the volume of data logged, number of users, and frequency of use"
  type        = string
  default     = "Small"
}
variable "sagemaker_mlflow_tracking_server_weekly_maintenance_window_start" {
  description = "(Optional) The day and time of the week in Coordinated Universal Time (UTC) 24-hour standard time that weekly maintenance updates are scheduled"
  type        = string
  default     = null
}
variable "sagemaker_mlflow_tracking_server_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
