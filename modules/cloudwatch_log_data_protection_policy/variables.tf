variable "cloudwatch_log_data_protection_policy_log_group_name" {
  description = "The name of the log group under which the log stream is to be created"
  type        = string
}
variable "cloudwatch_log_data_protection_policy_policy_document" {
  description = "Specifies the data protection policy in JSON"
  type        = string
}
