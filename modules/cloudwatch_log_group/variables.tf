variable "cloudwatch_log_group_kms_key_id" {
  description = "he ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested"
  type        = string
  default     = ""
}
variable "cloudwatch_log_group_name" {
  description = "The name of the log group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}
variable "cloudwatch_log_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "cloudwatch_log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0. If you select 0, the events in the log group are always retained and never expire"
  type        = number
  default     = null
}
variable "cloudwatch_log_group_skip_destroy" {
  description = "Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state"
  type        = bool
  default     = false
}
variable "cloudwatch_log_group_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
