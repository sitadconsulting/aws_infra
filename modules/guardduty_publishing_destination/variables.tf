variable "guardduty_publishing_destination_destination_arn" {
  description = "(Required) Bucket ARN and prefix under which the findings get exported. Bucket-ARN is required, the prefix is optional and will be AWSLogs/[Account-ID]/GuardDuty/[Region]/ if not provided"
  type        = string
}
variable "guardduty_publishing_destination_destination_type" {
  description = "(Optional) Currently there is only \"S3\" available as destination type which is also the default value"
  type        = string
  default     = null
}
variable "guardduty_publishing_destination_detector_id" {
  description = "(Required) Detector ID of the GuardDuty"
  type        = string
}
variable "guardduty_publishing_destination_kms_key_arn" {
  description = "(Required) ARN of the KMS key used to encrypt GuardDuty findings. GuardDuty enforces this to be encrypted"
  type        = string
}
variable "guardduty_publishing_destination_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
