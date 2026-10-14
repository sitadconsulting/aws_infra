variable "bedrock_model_invocation_job_job_name" {
  description = "(Required) Name for the batch inference job"
  type        = string
}
variable "bedrock_model_invocation_job_model_id" {
  description = "(Required) Identifier of the foundation model, or inference profile, to use for the batch inference job"
  type        = string
}
variable "bedrock_model_invocation_job_role_arn" {
  description = "(Required) ARN of the IAM service role that Amazon Bedrock can assume to carry out and manage the batch inference job"
  type        = string
}
variable "bedrock_model_invocation_job_skip_destroy" {
  description = "(Optional) Whether to leave the batch inference job in its current state when destroying the resource, instead of stopping it"
  type        = bool
  default     = false
}
variable "bedrock_model_invocation_job_timeout_duration_in_hours" {
  description = "(Optional) Number of hours after which to force the batch inference job to time out"
  type        = number
  default     = null
}
variable "bedrock_model_invocation_job_input_data_config" {
  description = "(Required) Location of the input data for the batch inference job"
  type        = list(object({
    s3_input_data_config = list(object({
      s3_bucket_owner = optional(string)
      s3_input_format = optional(string)
      s3_uri          = string
    }))
  }))
}
variable "bedrock_model_invocation_job_output_data_config" {
  description = "(Required) Location where the results of the batch inference job are stored"
  type        = list(object({
    s3_bucket_owner      = optional(string)
    s3_encryption_key_id = optional(string)
    s3_uri               = string
  }))
}
variable "bedrock_model_invocation_job_vpc_config" {
  description = "(Optional) VPC configuration for the data used by the batch inference job"
  type        = list(object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  }))
  default     = []
}
