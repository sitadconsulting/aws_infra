variable "backup_report_plan_description" {
  description = "(Optional) Description of the report plan with a maximum of 1,024 characters"
  type        = string
  default     = null
}
variable "backup_report_plan_name" {
  description = "(Required) Unique name of the report plan. The name must be between 1 and 256 characters, starting with a letter, and consisting of letters, numbers, and underscores"
  type        = string
}
variable "backup_report_plan_tags" {
  description = "(Optional) Metadata that you can assign to help organize the report plans you create"
  type        = map(string)
  default     = {}
}
variable "backup_report_plan_report_delivery_channel" {
  description = "(Required) Object that contains information about where and how to deliver your reports, specifically your Amazon S3 bucket name, S3 key prefix, and the formats of your reports"
  type        = list(object({
    formats        = optional(list(string))
    s3_bucket_name = string
    s3_key_prefix  = optional(string)
  }))
}
variable "backup_report_plan_report_setting" {
  description = "(Required) Object that identifies the report template for the report. Reports are built using a report template"
  type        = list(object({
    accounts             = optional(list(string))
    framework_arns       = optional(list(string))
    number_of_frameworks = optional(number)
    organization_units   = optional(list(string))
    regions              = optional(list(string))
    report_template      = string
  }))
}
