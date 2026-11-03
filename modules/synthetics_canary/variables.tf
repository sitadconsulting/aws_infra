variable "synthetics_canary_artifact_s3_location" {
  description = "(Required) Location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary"
  type        = string
}
variable "synthetics_canary_delete_lambda" {
  description = "(Optional) Specifies whether to also delete the Lambda functions and layers used by this canary. The default is false"
  type        = bool
  default     = false
}
variable "synthetics_canary_execution_role_arn" {
  description = "(Required) ARN of the IAM role to be used to run the canary"
  type        = string
}
variable "synthetics_canary_failure_retention_period" {
  description = "(Optional) Number of days to retain data about failed runs of this canary. If you omit this field, the default of 31 days is used. The valid range is 1 to 455 days"
  type        = number
  default     = null
}
variable "synthetics_canary_handler" {
  description = "(Required) Entry point to use for the source code when running the canary. This value must end with the string .handler"
  type        = string
}
variable "synthetics_canary_kms_key_arn" {
  description = "(Optional) ARN of the customer-managed KMS key used to encrypt the environment variables of the canary's Lambda function at rest. If omitted, an AWS owned key is used. Note that this is distinct from artifact_config.s3_encryption.kms_key_arn, which encrypts the artifacts the canary uploads to Amazon S3"
  type        = string
  default     = null
}
variable "synthetics_canary_name" {
  description = "(Required) Name for this canary. Has a maximum length of 255 characters. Valid characters are lowercase alphanumeric, hyphen, or underscore"
  type        = string
}
variable "synthetics_canary_runtime_version" {
  description = "(Required) Runtime version to use for the canary. Versions change often so consult the Amazon CloudWatch documentation for the latest valid versions. Values include syn-python-selenium-1.0, syn-nodejs-puppeteer-3.0, syn-nodejs-2.2, syn-nodejs-2.1, syn-nodejs-2.0, and syn-1.0"
  type        = string
  default     = null
}
variable "synthetics_canary_s3_bucket" {
  description = "(Optional) Full bucket name which is used if your canary script is located in S3. The bucket must already exist. Conflicts with zip_file"
  type        = string
  default     = null
}
variable "synthetics_canary_s3_key" {
  description = "(Optional) S3 key of your script. Conflicts with zip_file"
  type        = string
  default     = null
}
variable "synthetics_canary_s3_version" {
  description = "(Optional) S3 version ID of your script. Conflicts with zip_file"
  type        = string
  default     = null
}
variable "synthetics_canary_start_canary" {
  description = "(Optional) Whether to run or stop the canary"
  type        = bool
  default     = null
}
variable "synthetics_canary_success_retention_period" {
  description = "(Optional) Number of days to retain data about successful runs of this canary. If you omit this field, the default of 31 days is used. The valid range is 1 to 455 days"
  type        = number
  default     = null
}
variable "synthetics_canary_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "synthetics_canary_zip_file" {
  description = "(Optional) ZIP file that contains the script, if you input your canary script directly into the canary instead of referring to an S3 location. It can be up to 225KB. Conflicts with s3_bucket, s3_key, and s3_version"
  type        = string
  default     = null
}
variable "synthetics_canary_artifact_config" {
  description = "(Optional) configuration for canary artifacts, including the encryption-at-rest settings for artifacts that the canary uploads to Amazon S3"
  type        = list(object({
    s3_encryption = optional(list(object({
      encryption_mode = optional(string)
      kms_key_arn     = optional(string)
    })), [])
  }))
  default     = []
}
variable "synthetics_canary_run_config" {
  description = "(Optional) Configuration block for individual canary runs"
  type        = list(object({
    timeout_in_seconds     = optional(number)
    memory_in_mb           = optional(number)
    active_tracing         = optional(bool)
    environment_variables  = optional(map(string))
    ephemeral_storage      = optional(number)
  }))
  default     = []
}
variable "synthetics_canary_schedule" {
  description = "(Required) Configuration block providing how often the canary is to run and when these test runs are to stop"
  type        = list(object({
    expression          = string
    duration_in_seconds = optional(number)
    retry_config        = optional(list(object({
      max_retries = number
    })), [])
  }))
}
variable "synthetics_canary_vpc_config" {
  description = "(Optional) Configuration block"
  type        = list(object({
    subnet_ids                  = list(string)
    security_group_ids          = list(string)
    ipv6_allowed_for_dual_stack = optional(bool)
  }))
  default     = []
}
