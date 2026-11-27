variable "mwaa_environment_airflow_configuration_options" {
  description = "(Optional) Airflow override options"
  type        = map(string)
  default     = {}
}
variable "mwaa_environment_airflow_version" {
  description = "(Optional) Airflow version of your environment, will be set by default to the latest version that MWAA supports"
  type        = string
  default     = null
}
variable "mwaa_environment_dag_s3_path" {
  description = "(Required) Relative path to the DAG folder on your Amazon S3 storage bucket. For example, dags"
  type        = string
}
variable "mwaa_environment_endpoint_management" {
  description = "(Optional) Whether the VPC endpoints configured for the environment are created and managed by the customer or by AWS. If set to SERVICE, Amazon MWAA will create and manage the required VPC endpoints in your VPC. If set to CUSTOMER, you must create, and manage, the VPC endpoints for your VPC. Defaults to SERVICE if not set "
  type        = string
  default     = null
}
variable "mwaa_environment_environment_class" {
  description = "(Optional) Environment class for the cluster. Possible options are mw1.micro, mw1.small, mw1.medium, mw1.large. Will be set by default to mw1.small"
  type        = string
  default     = null
}
variable "mwaa_environment_execution_role_arn" {
  description = "(Required) ARN of the task execution role that the Amazon MWAA and its environment can assume"
  type        = string
}
variable "mwaa_environment_kms_key" {
  description = "(Optional) ARN of your KMS key that you want to use for encryption. Will be set to the ARN of the managed KMS key aws/airflow by default"
  type        = string
  default     = null
}
variable "mwaa_environment_max_webservers" {
  description = "(Optional) Maximum number of web servers that you want to run in your environment. Value need to be between 2 and 5 if environment_class is not mw1.micro, 1 otherwise"
  type        = number
  default     = null
}
variable "mwaa_environment_max_workers" {
  description = "(Optional) Maximum number of workers that can be automatically scaled up. Value need to be between 1 and 25. Will be 10 by default"
  type        = number
  default     = null
}
variable "mwaa_environment_min_webservers" {
  description = "(Optional) Minimum number of web servers that you want to run in your environment. Value need to be between 2 and 5 if environment_class is not mw1.micro, 1 otherwise"
  type        = number
  default     = null
}
variable "mwaa_environment_min_workers" {
  description = "(Optional) Minimum number of workers that you want to run in your environment. Will be 1 by default"
  type        = number
  default     = null
}
variable "mwaa_environment_name" {
  description = "(Required) Name of the Apache Airflow Environment"
  type        = string
}
variable "mwaa_environment_plugins_s3_object_version" {
  description = "(Optional) Version of the plugins.zip file you want to use"
  type        = string
  default     = null
}
variable "mwaa_environment_plugins_s3_path" {
  description = "(Optional) Relative path to the plugins.zip file on your Amazon S3 storage bucket. For example, plugins.zip. If a relative path is provided in the request, then plugins_s3_object_version is required"
  type        = string
  default     = null
}
variable "mwaa_environment_requirements_s3_object_version" {
  description = "(Optional) Version of the requirements.txt file you want to use"
  type        = string
  default     = null
}
variable "mwaa_environment_requirements_s3_path" {
  description = "(Optional) Relative path to the requirements.txt file on your Amazon S3 storage bucket. For example, requirements.txt. If a relative path is provided in the request, then requirements_s3_object_version is required"
  type        = string
  default     = null
}
variable "mwaa_environment_schedulers" {
  description = "(Optional) Number of schedulers that you want to run in your environment. v2.0.2 and above accepts 2 - 5, default 2. v1.10.12 accepts 1"
  type        = number
  default     = null
}
variable "mwaa_environment_source_bucket_arn" {
  description = "(Required) ARN of your Amazon S3 storage bucket. For example, arn:aws:s3:::airflow-mybucketname"
  type        = string
}
variable "mwaa_environment_startup_script_s3_object_version" {
  description = "(Optional) Version of the startup shell script you want to use. You must specify the version ID that Amazon S3 assigns to the file every time you update the script"
  type        = string
  default     = null
}
variable "mwaa_environment_startup_script_s3_path" {
  description = "(Optional) Relative path to the script hosted in your bucket. The script runs as your environment starts before starting the Apache Airflow process. Use this script to install dependencies, modify configuration options, and set environment variables"
  type        = string
  default     = null
}
variable "mwaa_environment_tags" {
  description = "(Optional) Map of resource tags to associate with the resource"
  type        = map(string)
  default     = {}
}
variable "mwaa_environment_webserver_access_mode" {
  description = " (Optional) Whether the webserver should be accessible over the internet or via your specified VPC. Possible options: PRIVATE_ONLY (default), PUBLIC_ONLY and PUBLIC_AND_PRIVATE"
  type        = string
  default     = null
}
variable "mwaa_environment_weekly_maintenance_window_start" {
  description = "(Optional) Start date for the weekly maintenance window"
  type        = string
  default     = null
}
variable "mwaa_environment_worker_replacement_strategy" {
  description = "(Optional) Worker replacement strategy. Valid values: FORCED, GRACEFUL"
  type        = string
  default     = null
}
variable "mwaa_environment_logging_configuration" {
  description = "(Optional) Apache Airflow logs you want to send to Amazon CloudWatch Logs"
  type        = list(object({
    dag_processing_logs = optional(list(object({ 
      enabled   = optional(bool)
      log_level = optional(string)
    })), [])
    scheduler_logs      = optional(list(object({
      enabled   = optional(bool)
      log_level = optional(string)
    })), [])
    task_logs           = optional(list(object({
      enabled   = optional(bool)
      log_level = optional(string)
    })), [])
    webserver_logs      = optional(list(object({
      enabled   = optional(bool)
      log_level = optional(string)
    })), [])
    worker_logs         = optional(list(object({
      enabled   = optional(bool)
      log_level = optional(string)
    })), [])
  }))
  default     = []
}
variable "mwaa_environment_network_configuration" {
  description = "(Required) Network configuration for your Apache Airflow Environment. This includes two private subnets as well as security groups for the Airflow environment. Each subnet requires internet connection, otherwise the deployment will fail"
  type        = list(object({
    security_group_ids = list(string) 
    subnet_ids         = list(string)
  }))
}
