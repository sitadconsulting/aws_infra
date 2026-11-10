variable "cloudtrail_cloud_watch_logs_group_arn" {
  description = "(Optional) Log group name using an ARN that represents the log group to which CloudTrail logs will be delivered. Note that CloudTrail requires the Log Stream wildcard"
  type        = string
  default     = null
}
variable "cloudtrail_cloud_watch_logs_role_arn" {
  description = "(Optional) Role for the CloudWatch Logs endpoint to assume to write to a user’s log group"
  type        = string
  default     = null
}
variable "cloudtrail_enable_log_file_validation" {
  description = "(Optional) Whether log file integrity validation is enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "cloudtrail_enable_logging" {
  description = "(Optional) Enables logging for the trail. When set to true, logging is started by calling the StartLogging API. When set to false, logging is stopped by calling the StopLogging API. Defaults to true"
  type        = bool
  default     = true
}
variable "cloudtrail_include_global_service_events" {
  description = "(Optional) Whether the trail is publishing events from global services such as IAM to the log files. Defaults to true"
  type        = bool
  default     = true
}
variable "cloudtrail_is_multi_region_trail" {
  description = "(Optional) Whether the trail is created in the current region or in all regions. Defaults to false"
  type        = bool
  default     = false
}
variable "cloudtrail_is_organization_trail" {
  description = "(Optional) Whether the trail is an AWS Organizations trail. Organization trails log events for the master account and all member accounts. Can only be created in the organization master account. Defaults to false"
  type        = bool
  default     = false
}
variable "cloudtrail_kms_key_id" {
  description = "(Optional) KMS key ARN to use to encrypt the logs delivered by CloudTrail"
  type        = string
  default     = null
}
variable "cloudtrail_name" {
  description = "(Required) Name of the trail"
  type        = string
}
variable "cloudtrail_recursive_logging" {
  description = "(Optional) Whether CloudTrail logs events it generates when delivering log files to the trail's destinations, such as Amazon S3 and CloudWatch Logs. Set to false to suppress these events. See Recursive logging for details. If not specified, defaults to true"
  type        = bool
  default     = true
}
variable "cloudtrail_s3_bucket_name" {
  description = "(Required) Name of the S3 bucket designated for publishing log files"
  type        = string
}
variable "cloudtrail_s3_key_prefix" {
  description = "(Optional) S3 key prefix that follows the name of the bucket you have designated for log file delivery"
  type        = string
  default     = null
}
variable "cloudtrail_sns_topic_name" {
  description = "(Optional) Name of the Amazon SNS topic defined for notification of log file delivery. Specify the SNS topic ARN if it resides in another region"
  type        = string
  default     = null
}
variable "cloudtrail_tags"{
  description = "(Optional) Map of tags to assign to the trail"
  type        = map(string)
  default     = {}
}
variable "cloudtrail_advanced_event_selector" {
  description = "(Optional) Specifies an advanced event selector for enabling data event logging. Fields documented below. Conflicts with event_selector"
  type        = list(object({
    name           = optional(string)
    field_selector = optional(list(object({
      ends_with       = optional(list(string))
      equals          = optional(list(string))
      field           = string
      not_ends_with   = optional(list(string))
      not_equals      = optional(list(string))
      not_starts_with = optional(list(string))
      starts_with     = optional(list(string))
    })), [])
  }))
  default     = []
}
variable "cloudtrail_event_selector" {
  description = "(Optional) Specifies an event selector for enabling data event logging. Fields documented below. Please note the CloudTrail limits when configuring these. Conflicts with advanced_event_selector"
  type        = list(object({
    exclude_management_event_sources = optional(list(string))
    include_management_events        = optional(bool)
    read_write_type                  = optonal(string)
    data_resource                    = optional(list(object({
      type   = string
      values = list(string)
    })), [])
  }))
  default     = []
}
variable "cloudtrail_insight_selector" {
  description = "(Optional) Configuration block for identifying unusual operational activity"
  type        = list(object({
    insight_type = string 
  }))
  default     = []
}
