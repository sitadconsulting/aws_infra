variable "sagemaker_training_job_delete_vpc_enis_on_destroy" {
  description = "(Optional) Whether to delete detached VPC ENIs that SageMaker may leave behind when destroying the training job"
  type        = bool
  default     = true
}
variable "sagemaker_training_job_delete_model_packages_on_destroy" {
  description = "(Optional) Whether to delete model packages in the configured model package group when destroying the training job" 
  type        = bool
  default     = true
}
variable "sagemaker_training_job_enable_inter_container_traffic_encryption" {
  description = "(Optional) Whether to encrypt inter-container traffic. When enabled, communications between containers are encrypted"
  type        = bool
  default     = false
}
variable "sagemaker_training_job_enable_managed_spot_training" {
  description = "(Optional) Whether to use managed spot training. Optimizes the cost of training by using Amazon EC2 Spot Instances. Conflicts with serverless_job_config"
  type        = bool
  default     = null
}
variable "sagemaker_training_job_enable_network_isolation" {
  description = "(Optional) Whether to isolate the training container from the network. No inbound or outbound network calls can be made."
  type        = bool
  default     = false
}
variable "sagemaker_training_job_environment" {
  description = "(Optional) Map of environment variables to set in the training container. Maximum of 100 entries. Conflicts with serverless_job_config"
  type        = map(string)
  default     = null
}
variable "sagemaker_training_job_hyper_parameters" {
  description = "(Optional) Map of hyperparameters for the training algorithm. Maximum of 100 entries"
  type        = map(string)
  default     = null
}
variable "sagemaker_training_job_role_arn" {
  description = "(Required) ARN of the IAM role that SageMaker AI assumes to perform tasks on your behalf during training"
  type        = string
}
variable "sagemaker_training_job_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = null
}
variable "sagemaker_training_job_training_job_name" {
  description = "(Required) Name of the training job. Must be between 1 and 63 characters, start with a letter or number, and contain only letters, numbers, and hyphens"
  type        = string
}
variable "sagemaker_training_job_algorithm_specification" {
  description = "(Optional) Algorithm-related parameters of the training job. Conflicts with serverless_job_config"
  type        = list(object({
    algorithm_name                       = optional(string)
    container_arguments                  = optional(list(string))
    container_entrypoint                 = optional(list(string))
    enable_sagemaker_metrics_time_series = optional(bool)
    training_image                       = optional(string)
    training_input_mode                  = optional(string)
    metric_definitions                   = optional(list(object({
      name  = string
      regex = string
    })), [])
    training_image_config                = optional(list(object({
      training_repository_access_mode = optional(string)
      training_repository_auth_config = optional(list(object({
        training_repository_credentials_provider_arn = optional(string)
      })), [])
    })), [])
  }))
  default     = []
}
variable "sagemaker_training_job_checkpoint_config" {
  description = "(Optional) Location of checkpoints during training. Conflicts with serverless_job_config"
  type        = list(object({
    local_path = optional(string)
    s3_uri     = string
  }))
  default     = []
}
variable "sagemaker_training_job_debug_hook_config" {
  description = "(Optional) Configuration for debugging rules. Conflicts with serverless_job_config"
  type        = list(object({
    hook_parameters = optional(map(string))
    local_path      = optional(string)
    s3_output_path  = string
    collection_configurations = optional(list(object({
      collection_name       = optional(string)
      collection_parameters = optional(map(string))
    })), [])
  }))
  default     = []
}
variable "sagemaker_training_job_debug_rule_configurations" {
  description = "(Optional) List of debug rule configurations. Maximum of 20"
  type        = list(object({
    instance_type           = optional(string)
    local_path              = optional(string)
    rule_configuration_name = string
    rule_evaluator_image    = string
    rule_parameters         = optional(map(string))
    s3_output_path          = optional(string)
    volume_size_in_gb       = optional(number)
  }))
  default     = []
}
variable "sagemaker_training_job_experiment_config" {
  description = "(Optional) Associates a SageMaker AI Experiment or Trial to the training job. Conflicts with serverless_job_config"
  type        = list(object({
    experiment_name              = optional(string)
    run_name                     = optional(string)
    trial_component_display_name = optional(string)
    trial_name                   = optional(string)
  }))
  default     = []
}
variable "sagemaker_training_job_infra_check_config" {
  description = "(Optional) Infrastructure health check configuration"
  type        = list(object({
    enable_infra_check = optional(bool)
  }))
  default     = []
}
variable "sagemaker_training_job_input_data_config" {
  description = "(Optional) List of input data channel configurations for the training job. Maximum of 20"
  type        = list(object({
    channel_name        = string
    compression_type    = optional(string)
    content_type        = optional(string)
    input_mode          = optional(string)
    record_wrapper_type = optional(string)
    data_source         = list(object({
      file_system_data_source = optional(list(object({
        directory_path          = string
        file_system_access_mode = string
        file_system_id          = string
        file_system_type        = string
      })), [])
      s3_data_source          = optional(list(object({
        attribute_names           = optional(list(string))
        instance_group_names      = optional(list(string))
        s3_data_distribution_type = optional(string)
        s3_data_type              = string
        s3_uri                    = string
        hub_access_config         = optional(list(object({
          hub_content_arn = string
        })), [])
        model_access_config       = optional(list(object({
          accept_eula =  bool
        })), [])
      })), [])
    }))
    shuffle_config = optional(list(object({
      seed = optional(number)
    })), [])
  }))
  default     = []
}
variable "sagemaker_training_job_mlflow_config" {
  description = "(Optional) MLflow integration configuration"
  type        = list(object({
    mlflow_experiment_name = optional(string)
    mlflow_resource_arn    = string
    mlflow_run_name        = optional(string)
  }))
  default     = []
}
variable "sagemaker_training_job_model_package_config" {
  description = "(Optional) Model package configuration. Requires serverless_job_config"
  type        = list(object({
    model_package_group_arn  = string
    source_model_package_arn = optional(string)
  }))
  default     = []
}
variable "sagemaker_training_job_output_data_config" {
  description = "(Required) Location of the output data from the training job"
  type        = list(object({
    compression_type = optional(string)
    kms_key_id       = optional(string)
    s3_output_path   = string
  }))
}
variable "sagemaker_training_job_profiler_config" {
  description = "(Optional) Configuration for the profiler. Conflicts with serverless_job_config"
  type        = list(object({
    disable_profiler                   = optional(bool)
    profiling_interval_in_milliseconds = optional(number)
    profiling_parameters               = optional(map(string))
    s3_output_path                     = optional(string)
  }))
  default     = []
}
variable "sagemaker_training_job_profiler_rule_configurations" {
  description = "(Optional) List of profiler rule configurations. Maximum of 20. Conflicts with serverless_job_config"
  type        = list(object({
    instance_type           = optional(string)
    local_path              = optional(string)
    rule_configuration_name = string
    rule_evaluator_image    = string
    rule_parameters         = optional(map(string))
    s3_output_path          = optional(string)
    volume_size_in_gb       = optional(number)
  }))
  default     = []
}
variable "sagemaker_training_job_remote_debug_config" {
  description = "(Optional) Configuration for remote debugging"
  type        = list(object({
    enable_remote_debug = optional(bool)
  }))
  default     = []
}
variable "sagemaker_training_job_resource_config" {
  description = "(Optional) Resources for the training job, including compute instances and storage volumes"
  type        = list(object({
    instance_count               = optional(number)
    instance_type                = optional(string)
    keep_alive_period_in_seconds = optional(number)
    training_plan_arn            = optional(string)
    volume_kms_key_id            = optional(string)
    volume_size_in_gb            = optional(number)
    instance_groups              = optional(list(object({
      instance_count      = optional(number)
      instance_group_name = optional(string)
      instance_type       = optional(string)
    })), [])
    instance_placement_config    = optional(list(object({
      enable_multiple_jobs     = optional(bool)
      placement_specifications = optional(list(object({
        instance_count  = optional(number)
        ultra_server_id = optional(string)
      })), [])
    })), [])
  }))
  default     = []
}
variable "sagemaker_training_job_retry_strategy" {
  description = "(Optional) Number of times to retry the job if it fails. Conflicts with serverless_job_config"
  type        = list(object({
    maximum_retry_attempts = number
  }))
  default     = []
}
variable "sagemaker_training_job_serverless_job_config" {
  description = "(Optional) Configuration for serverless training jobs using foundation models. Conflicts with algorithm_specification, enable_managed_spot_training, environment, retry_strategy, checkpoint_config, debug_hook_config, experiment_config, profiler_config, profiler_rule_configurations, and tensor_board_output_config"
  type        = list(object({
    accept_eula             = optional(bool)
    base_model_arn          = string
    customization_technique = optional(string)
    evaluation_type         = optional(string)
    evaluator_arn           = optional(string)
    job_type                = string
    peft                    = optional(string)
  }))
  default     = []
}
variable "sagemaker_training_job_session_chaining_config" {
  description = "(Optional) Configuration for session tag chaining"
  type        = list(object({
    enable_session_tag_chaining = optional(bool)
  }))
  default     = []
}
variable "sagemaker_training_job_stopping_condition" {
  description = "(Optional) Training job stopping condition"
  type        = list(object({
    max_pending_time_in_seconds = optional(number)
    max_runtime_in_seconds      = optional(number)
    max_wait_time_in_seconds    = optional(number)
  }))
  default     = []
}
variable "sagemaker_training_job_tensor_board_output_config" {
  description = "(Optional) Configuration for TensorBoard output. Conflicts with serverless_job_config"
  type        = list(object({
    local_path     = optional(string)
    s3_output_path = string
  }))
  default     = []
}
variable "sagemaker_training_job_vpc_config" {
  description = "(Optional) VPC configuration for the training job"
  type        = list(object({
    security_group_ids = list(string)
    subnets            = list(string)
  }))
  default     = []
}
