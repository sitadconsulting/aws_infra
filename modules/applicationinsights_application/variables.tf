variable "applicationinsights_application_auto_config_enabled" {
  description = "(Optional) Whether to automatically configure unmonitored resources in the resource group"
  type        = bool
  default     = null
}
variable "applicationinsights_application_auto_create" {
  description = "(Optional) Configures all of the resources in the resource group by applying the recommended configurations"
  type        = bool
  default     = null
}
variable "applicationinsights_application_cwe_monitor_enabled" {
  description = "(Optional) Whether to enable Application Insights to listen to CloudWatch events for the application resources, such as instance terminated, failed deployment, and others"
  type        = bool
  default     = null
}
variable "applicationinsights_application_grouping_type" {
  description = "(Optional) Application Insights can create applications based on a resource group or on an account. To create an account-based application using all of the resources in the account, set this parameter to ACCOUNT_BASED"
  type        = string
  default     = null
}
variable "applicationinsights_application_ops_center_enabled" {
  description = "(Optional) When set to true, creates opsItems for any problems detected on an application"
  type        = bool
  default     = null
}
variable "applicationinsights_application_ops_item_sns_topic_arn" {
  description = "(Optional) SNS topic provided to Application Insights that is associated to the created opsItem. Allows you to receive notifications for updates to the opsItem"
  type        = string
  default     = null
}
variable "applicationinsights_application_resource_group_name" {
  description = "(Required) Name of the resource group"
  type        = string
}
variable "applicationinsights_application_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
