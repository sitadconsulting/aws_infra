variable "lambda_function_architectures" {
  description = "Instruction set architecture for your Lambda function. Valid values are [\"x86_64\"] and [\"arm64\"]. Default is [\"x86_64\"]. Removing this attribute, function's architecture stay the same"
  type        = list(string)
  default     = [ "x86_64", ]
}
variable "lambda_function_code_signing_config_arn" {
  description = "To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function"
  type        = string
  default     = ""
}
variable "lambda_function_description" {
  description = "Description of what your Lambda Function does"
  type        = string
  default     = ""
}
variable "lambda_function_filename" {
  description = "Path to the function's deployment package within the local filesystem. Exactly one of filename, image_uri, or s3_bucket must be specified"
  type        = string
  default     = null
}
variable "lambda_function_function_name" {
  description = "Unique name for your Lambda Function"
  type        = string
}
variable "lambda_function_handler" {
  description = "Function entrypoint in your code"
  type        = string
  default     = ""
}
variable "lambda_function_image_uri" {
  description = "ECR image URI containing the function's deployment package. Exactly one of filename, image_uri, or s3_bucket must be specified"
  type        = string
  default     = null
}
variable "lambda_function_kms_key_arn" {
  description = "ARN of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration"
  type        = string
  default     = ""
}
variable "lambda_function_layers" {
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function"
  type        = list(string)
  default     = []
}
variable "lambda_function_memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128"
  type        = number
  default     = null
}
variable "lambda_function_package_type" {
  description = "Lambda deployment package type. Valid values are Zip and Image. Defaults to Zip"
  type        = string
  default     = "Zip"
}
variable "lambda_function_publish" {
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to false"
  type        = bool
  default     = false
}
variable "lambda_function_reserved_concurrent_executions" {
  description = "Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1"
  type        = number
  default     = -1
}
variable "lambda_function_role" {
  description = "ARN of the function's execution role. The role provides the function's identity and access to AWS services and resources"
  type        = string
}
variable "lambda_function_runtime" {
  description = "Identifier of the function's runtime"
  type        = string
  default     = ""
}
variable "lambda_function_s3_bucket" {
  description = "S3 bucket location containing the function's deployment package. This bucket must reside in the same AWS region where you are creating the Lambda function. Exactly one of filename, image_uri, or s3_bucket must be specified. When s3_bucket is set, s3_key is required"
  type        = string
  default     = null
}
variable "lambda_function_s3_key" {
  description = "S3 key of an object containing the function's deployment package. When s3_bucket is set, s3_key is required"
  type        = string
  default     = null
}
variable "lambda_function_s3_object_version" {
  description = "Object version containing the function's deployment package. Conflicts with filename and image_uri"
  type        = string
  default     = null
}
variable "lambda_function_skip_destroy" {
  description = "Set to true if you do not wish the function to be deleted at destroy time, and instead just remove the function from the Terraform state"
  type        = bool
  default     = false
}
variable "lambda_function_source_code_hash" {
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key. The usual way to set this is filebase64sha256(\"file.zip\") (Terraform 0.11.12 and later) or base64sha256(file(\"file.zip\")) (Terraform 0.11.11 and earlier), where \"file.zip\" is the local filename of the lambda function source archive"
  type        = string
  default     = null
}
variable "lambda_function_tags" {
  description = "Map of tags to assign to the object"
  type        = map(string)
  default     = {}
}
variable "lambda_function_timeout" {
  description = "Amount of time your Lambda Function has to run in seconds. Defaults to 3"
  type        = number
  default     = null
}
variable "lambda_function_dead_letter_config" {
  description = "Dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing"
  type        = list(object({
    target_arn = string
  }))
  default     = []
}
variable "lambda_function_environment" {
  description = "Environment variables that are accessible from function code during execution"
  type        = list(object({
    variables = map(string)
  }))
  default     = []
}
variable "lambda_function_ephemeral_storage" {
  description = "The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB. This parameter is used to expand the total amount of Ephemeral storage available, beyond the default amount of 512MB"
  type        = list(object({
    size = optional(number)
  }))
  default     = []
}
variable "lambda_function_file_system_config" {
  description = "Connection settings for an EFS file system. Before creating or updating Lambda functions with file_system_config, EFS mount targets must be in available lifecycle state. Use depends_on to explicitly declare this dependency"
  type        = list(object({
    arn              = string
    local_mount_path = string
  }))
  default     = []
}
variable "lambda_function_image_config" {
  description = "Container image configuration values that override the values in the container image Dockerfile"
  type        = list(object({
    command           = optional(list(string))
    entry_point       = optional(list(string))
    working_directory = optional(string)
  }))
  default     = []
}
variable "lambda_function_snap_start" {
  description = "Snap start settings for low-latency startups. This feature is currently only supported for java11 runtimes. Remove this block to delete the associated settings (rather than setting apply_on = \"None\")"
  type        = list(object({
    apply_on = string
  }))
  default     = []
}
variable "lambda_function_tracing_config" {
  description = "Whether to sample and trace a subset of incoming requests with AWS X-Ray. Valid values are PassThrough and Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with \"sampled=1\". If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call X-Ray for a tracing decision"
  type        = list(object({
    mode = string
  }))
  default     = []
}
variable "lambda_function_vpc_config" {
  description = "For network connectivity to AWS resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC "
  type        = list(object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  }))
  default     = []
}
