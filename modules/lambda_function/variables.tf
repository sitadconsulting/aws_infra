variable "lambda_function_architectures" {
  description = "(Optional) Instruction set architecture for your Lambda function. Valid values are [\"x86_64\"] and [\"arm64\"]. Default is [\"x86_64\"]. Removing this attribute, function's architecture stays the same"
  type        = list(string)
  default     = [ "x86_64", ]
}
variable "lambda_function_code_sha256" {
  description = "(Optional) Base64-encoded representation the source code package file. Use this argument to trigger updates when the function source code changes. For OCI, this value is relayed directly from the image digest. For zip files, this value is the Base64 encoded SHA-256 hash of the .zip file. Layers are not included in the calculation. To trigger updates using a non-standard hashing algorithm, use the source_code_hash argument instead"
  type        = string
  default     = null
}
variable "lambda_function_code_signing_config_arn" {
  description = "(Optional) ARN of a code-signing configuration to enable code signing for this function"
  type        = string
  default     = null
}
variable "lambda_function_description" {
  description = "(Optional) Description of what your Lambda Function does"
  type        = string
  default     = null
}
variable "lambda_function_filename" {
  description = "(Optional) Path to the function's deployment package within the local filesystem. Conflicts with image_uri and s3_bucket. One of filename, image_uri, or s3_bucket must be specified"
  type        = string
  default     = null
}
variable "lambda_function_function_name" {
  description = "(Required) Unique name for your Lambda Function"
  type        = string
}
variable "lambda_function_handler" {
  description = "(Optional) Function entry point in your code. Required if package_type is Zip"
  type        = string
  default     = null
}
variable "lambda_function_image_uri" {
  description = "(Optional) ECR image URI containing the function's deployment package. Conflicts with filename and s3_bucket. One of filename, image_uri, or s3_bucket must be specified"
  type        = string
  default     = null
}
variable "lambda_function_kms_key_arn" {
  description = "(Optional) ARN of the KMS key used to encrypt environment variables. If not provided when environment variables are in use, AWS Lambda uses a default service key. If provided when environment variables are not in use, the AWS Lambda API does not save this configuration"
  type        = string
  default     = null
}
variable "lambda_function_layers" {
  description = "(Optional) List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function"
  type        = list(string)
  default     = null
}
variable "lambda_function_memory_size" {
  description = "(Optional) Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 32,768 MB (32 GB), in 1 MB increments. Defaults to 128"
  type        = number
  default     = null
}
variable "lambda_function_package_type" {
  description = "(Optional) Lambda deployment package type. Valid values are Zip and Image. Defaults to Zip"
  type        = string
  default     = "Zip"
}
variable "lambda_function_publish" {
  description = "(Optional) Whether to publish creation/change as new Lambda Function Version. Defaults to false"
  type        = bool
  default     = false
}
variable "lambda_function_publish_to" {
  description = "(Optional) Whether to publish to a alias or version number. Omit for regular version publishing. Option is LATEST_PUBLISHED"
  type        = string
  default     = null
}
variable "lambda_function_replace_security_groups_on_destroy" {
  description = "(Optional) Whether to replace the security groups on the function's VPC configuration prior to destruction. Default is false"
  type        = bool
  default     = false
}
variable "lambda_function_replacement_security_group_id" {
  description = "(Optional) List of security group IDs to assign to the function's VPC configuration prior to destruction. Required if replace_security_groups_on_destroy is true"
  type        = list(string)
  default     = null
}
variable "lambda_function_reserved_concurrent_executions" {
  description = "(Optional) Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1"
  type        = number
  default     = -1
}
variable "lambda_function_role" {
  description = "(Required) ARN of the function's execution role. The role provides the function's identity and access to AWS services and resources"
  type        = string
}
variable "lambda_function_runtime" {
  description = "(Optional) Identifier of the function's runtime. Required if package_type is Zip"
  type        = string
  default     = null
}
variable "lambda_function_s3_bucket" {
  description = "(Optional) S3 bucket location containing the function's deployment package. Conflicts with filename and image_uri. One of filename, image_uri, or s3_bucket must be specified"
  type        = string
  default     = null
}
variable "lambda_function_s3_key" {
  description = "(Optional) S3 key of an object containing the function's deployment package. Required if s3_bucket is set"
  type        = string
  default     = null
}
variable "lambda_function_s3_object_version" {
  description = "(Optional) Object version containing the function's deployment package. Conflicts with filename and image_uri"
  type        = string
  default     = null
}
variable "lambda_function_skip_destroy" {
  description = "(Optional) Whether to retain the old version of a previously deployed Lambda Layer. Default is false"
  type        = bool
  default     = false
}
variable "lambda_function_source_code_hash" {
  description = "(Optional) User-defined hash of the source code package file. Use this argument to trigger updates when the local function source code changes. This is a synthetic argument tracked only by the AWS provider and does not need to match the hashing algorithm used by Lambda to compute the CodeSha256 response value. Out-of-band changes to the source code will not be captured by this argument. To include out-of-band source code changes as an update trigger, use the code_sha256 argument instead"
  type        = string
  default     = null
}
variable "lambda_function_source_kms_key_arn" {
  description = "(Optional) ARN of the KMS key used to encrypt the function's .zip deployment package. Conflicts with image_uri"
  type        = string
  default     = null
}
variable "lambda_function_tags" {
  description = "(Optional) Key-value map of tags for the Lambda function"
  type        = map(string)
  default     = {}
}
variable "lambda_function_timeout" {
  description = "(Optional) Amount of time your Lambda Function has to run in seconds. Defaults to 3. Valid between 1 and 900"
  type        = number
  default     = null
}
variable "lambda_function_capacity_provider_config" {
  description = "(Optional) Configuration block for Lambda Capacity Provider that manages compute resources for Lambda functions"
  type        = list(object({
    lambda_managed_instances_capacity_provider_config = list(object({
      capacity_provider_arn                     = string
      execution_environment_memory_gib_per_vcpu = optional(number)
      per_execution_environment_max_concurrency = optional(number)
    }))
  }))
  default     = []
}
variable "lambda_function_dead_letter_config" {
  description = "(optional) Dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing"
  type        = list(object({
    target_arn = string
  }))
  default     = []
}
variable "lambda_function_durable_config" {
  description = "(Optional) Configuration block for durable function settings, including execution timeout, retention period for execution history, and an optional ARN of the AWS Key Management Service (AWS KMS) customer managed key that is used to encrypt your durable execution's payload data, including input, output, and error payloads"
  type        = list(object({
    execution_timeout = number
    kms_key_arn       = optional(string)
    retention_period  = optional(number)
  }))
  default     = []
}
variable "lambda_function_environment" {
  description = "(Optional) Environment variables that are accessible from function code during execution"
  type        = list(object({
    variables = map(string)
  }))
  default     = []
}
variable "lambda_function_ephemeral_storage" {
  description = "(Optional) The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB. This parameter is used to expand the total amount of Ephemeral storage available, beyond the default amount of 512MB"
  type        = list(object({
    size = optional(number)
  }))
  default     = []
}
variable "lambda_function_file_system_config" {
  description = "(Optional) Configuration block for EFS or S3 Files file system"
  type        = list(object({
    arn              = string
    local_mount_path = string
  }))
  default     = []
}
variable "lambda_function_image_config" {
  description = "(Optional) Container image configuration values that override the values in the container image Dockerfile"
  type        = list(object({
    command           = optional(list(string))
    entry_point       = optional(list(string))
    working_directory = optional(string)
  }))
  default     = []
}
variable "lambda_function_logging_config" {
  description = "(Optional) Configuration block for advanced logging settings"
  type        = list(object({
    application_log_level = optional(string)
    log_format            = string
    log_group             = optional(string)
    system_log_level      = optional(string)
  }))
  default     = []
}
variable "lambda_function_snap_start" {
  description = "(Optional) Configuration block for snap start settings"
  type        = list(object({
    apply_on = string
  }))
  default     = []
}
variable "lambda_function_tenancy_config" {
  description = "(Optional) Configuration block for Tenancy"
  type        = list(object({
    tenant_isolation_mode = string
  }))
  default     = []
}
variable "lambda_function_tracing_config" {
  description = "(Optional) Configuration block for X-Ray tracing"
  type        = list(object({
    mode = string
  }))
  default     = []
}
variable "lambda_function_vpc_config" {
  description = "(Optional) Configuration block for VPC"
  type        = list(object({
    ipv6_allowed_for_dual_stack = optional(bool)
    security_group_ids          = list(string)
    subnet_ids                  = list(string)
  }))
  default     = []
}
